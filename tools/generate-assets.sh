#!/usr/bin/env bash
# Generate a Meetup's downloadable brand assets (see .claude/rules/poster-buckets.md).
# Usage: npm run assets -- <meetup-id>   (default: claude-code-3)
# Same 2× capture as the posters; parts are pulled straight out of the poster CSS.
set -euo pipefail
ID="${1:-claude-code-3}"
SCALE="${SCALE:-2}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/meetups/$ID/assets/download"
PORT=8199
[ -f "$ROOT/meetups/$ID/index.html" ] || { echo "no meetup: $ID"; exit 1; }
mkdir -p "$OUT"
python3 -m http.server "$PORT" --directory "$ROOT" >/dev/null 2>&1 &
SRV=$!; trap 'kill $SRV 2>/dev/null || true' EXIT
sleep 1
playwright-cli goto "http://localhost:$PORT/meetups/$ID/" >/dev/null 2>&1 || \
  { playwright-cli open "http://localhost:$PORT/meetups/$ID/" >/dev/null 2>&1; }
sleep 2
CODE=$(cat <<'JS'
async (page) => {
  const dir="__OUT__", url="__URL__", scale=__SCALE__;
  const browser = page.context().browser();
  if(!browser) throw new Error("no browser handle — cannot open a deviceScaleFactor context");
  const ctx = await browser.newContext({viewport:{width:1960,height:1600}, deviceScaleFactor:scale});
  const p = await ctx.newPage();
  try {
    await p.goto(url);
    await p.evaluate(function(){return document.fonts.ready;});
    await p.waitForTimeout(600);
    const JOBS=[
      {file:"bg-portrait",  spec:{kind:"bg",mode:"portrait", w:1200,h:1500}},
      {file:"bg-landscape", spec:{kind:"bg",mode:"landscape",w:1920,h:1080}},
      {file:"title",        spec:{kind:"title",pad:24}, alpha:true},
      {file:"speaker-siriwat",   spec:{kind:"avatar",av:"siriwat.png",  w:200}, alpha:true},
      {file:"speaker-manassarn", spec:{kind:"avatar",av:"manassarn.png",w:200}, alpha:true},
      {file:"speaker-peerapat",  spec:{kind:"avatar",av:"peerapat.png", w:200}, alpha:true},
      {file:"session-1", spec:{kind:"session",i:0,w:1100,pad:54}},
      {file:"session-2", spec:{kind:"session",i:1,w:1100,pad:54}},
      {file:"session-3", spec:{kind:"session",i:2,w:1100,pad:54}}
    ];
    const done=[];
    for(const j of JOBS){
      await p.evaluate(function(s){window.assetCapture(s);}, j.spec);
      await p.evaluate(function(){return document.fonts.ready;});
      await p.waitForTimeout(300);
      await p.locator("#asset-art > *").first()
        .screenshot({path:dir+"/"+j.file+".png", omitBackground:!!j.alpha});
      done.push(j.file);
    }
    return "generated "+done.length+" assets at "+scale+"x into "+dir;
  } finally { await ctx.close(); }
}
JS
)
CODE="${CODE/__OUT__/$OUT}"
CODE="${CODE/__URL__/http://localhost:$PORT/meetups/$ID/}"
CODE="${CODE/__SCALE__/$SCALE}"
playwright-cli run-code "$CODE"
echo
echo "Captured into $OUT:"
find "$OUT" -name '*.png' | sort | while read -r f; do
  printf '  %-30s %s\n' "$(basename "$f")" \
    "$(sips -g pixelWidth -g pixelHeight "$f" | awk '/pixel/{printf "%s ", $2}')"
done
echo
echo "Review each PNG before committing."
