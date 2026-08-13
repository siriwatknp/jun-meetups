#!/usr/bin/env bash
# Generate a Meetup's poster PNGs (see docs/adr/0001, .claude/rules/poster-buckets.md).
# Usage: npm run posters -- <meetup-id>   (default: claude-code-3)
#        SCALE=3 npm run posters -- <id>  (needs higher-res source assets, see the rules doc)
# Captured at SCALE× device pixels: layout is identical to 1×, only the raster is denser.
set -euo pipefail
ID="${1:-claude-code-3}"
SCALE="${SCALE:-2}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/meetups/$ID/posters"
PORT=8199
[ -f "$ROOT/meetups/$ID/index.html" ] || { echo "no meetup: $ID"; exit 1; }
mkdir -p "$OUT/speakers"
python3 -m http.server "$PORT" --directory "$ROOT" >/dev/null 2>&1 &
SRV=$!; trap 'kill $SRV 2>/dev/null || true' EXIT
sleep 1
playwright-cli goto "http://localhost:$PORT/meetups/$ID/" >/dev/null 2>&1 || \
  { playwright-cli open "http://localhost:$PORT/meetups/$ID/" >/dev/null 2>&1; }
sleep 2
CODE=$(cat <<'JS'
async (page) => {
  const dir="__OUT__", url="__URL__", scale=__SCALE__;
  // deviceScaleFactor is fixed at context creation, so capture in a context of our own.
  const browser = page.context().browser();
  if(!browser) throw new Error("no browser handle — cannot open a deviceScaleFactor context");
  const ctx = await browser.newContext({viewport:{width:1960,height:1600}, deviceScaleFactor:scale});
  const p = await ctx.newPage();
  try {
    await p.goto(url);
    await p.evaluate(function(){return document.fonts.ready;});
    await p.waitForTimeout(600);
    const BUCKETS=[["fb-link",1200,630,"landscape"],["fb-photo",1200,1500,"portrait"],
                   ["ep-poster",800,1132,"portrait"],["wide-16-9",1920,1080,"landscape"]];
    const JOBS=[["event","",BUCKETS],["speakers","speakers/",BUCKETS],
                ["register","",[["register-today",1200,1500,"portrait"]]]];
    const done=[];
    for(const job of JOBS){
      var variant=job[0], sub=job[1], buckets=job[2];
      for(const b of buckets){
        var name=b[0],w=b[1],h=b[2],mode=b[3];
        await p.evaluate(function(a){window.posterCapture(a[0],a[1],a[2],a[3]);},[w,h,mode,variant]);
        await p.evaluate(function(){return document.fonts.ready;});
        await p.waitForTimeout(350);
        await p.locator("#poster-art").screenshot({path:dir+"/"+sub+name+".png"});
        done.push(sub+name);
      }
    }
    return "generated "+done.length+" posters at "+scale+"x into "+dir;
  } finally { await ctx.close(); }
}
JS
)
CODE="${CODE/__OUT__/$OUT}"
CODE="${CODE/__URL__/http://localhost:$PORT/meetups/$ID/}"
CODE="${CODE/__SCALE__/$SCALE}"
playwright-cli run-code "$CODE"
echo
echo "Captured (file pixels = bucket size × $SCALE):"
find "$OUT" -name '*.png' | sort | while read -r f; do
  printf '  %-34s %s\n' "${f#"$OUT"/}" \
    "$(sips -g pixelWidth -g pixelHeight "$f" | awk '/pixel/{printf "%s ", $2}')"
done
echo
echo "Review each PNG in $OUT before committing."
