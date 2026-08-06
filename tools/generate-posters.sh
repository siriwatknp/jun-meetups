#!/usr/bin/env bash
# Generate a Meetup's poster PNGs (see docs/adr/0001, .claude/rules/poster-buckets.md).
# Usage: npm run posters -- <meetup-id>   (default: claude-code-3)
set -euo pipefail
ID="${1:-claude-code-3}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/meetups/$ID/posters"
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
  await page.setViewportSize({width:1260,height:1560});
  const dir="__OUT__";
  const buckets=[["fb-link",1200,630,"landscape"],["fb-photo",1200,1500,"portrait"],["ep-poster",800,1132,"portrait"]];
  for(const b of buckets){
    var name=b[0],w=b[1],h=b[2],mode=b[3];
    await page.evaluate(function(a){window.posterCapture(a[0],a[1],a[2]);},[w,h,mode]);
    await page.evaluate(function(){return document.fonts.ready;});
    await page.waitForTimeout(300);
    await page.locator("#poster-art").screenshot({path:dir+"/"+name+".png"});
  }
  return "generated "+buckets.length+" posters into "+dir;
}
JS
)
CODE="${CODE/__OUT__/$OUT}"
playwright-cli run-code "$CODE"
echo "Review each PNG in $OUT before committing."
