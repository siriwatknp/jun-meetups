# Poster buckets & generation workflow

Posters are pre-rendered locally and committed (see ADR-0001). WYSIWYG: what renders on
screen at a bucket size IS the file.

## Buckets — 4 files, 3 layout modes

| File | Size | Mode | Use |
|---|---|---|---|
| `fb-link.png`  | 1200×630  | landscape 1.91:1 | Facebook link/cover |
| `ep-cover.png` | 1200×628  | landscape 1.91:1 | Eventpop shareable-link cover |
| `fb-photo.png` | 1200×1500 | portrait 4:5     | Facebook photo post |
| `ep-poster.png`| 800×1132  | portrait ~1:1.41 | Eventpop event page / email / ticket |

Only **two layout modes** to author: **landscape** (short/wide, two columns — the tightest,
design it first) and **portrait** (vertical stack; 4:5 and A-series share it, content reflows).

## Capture scale

Sizes above are the **layout** (CSS px). Files are captured at **2× device pixels** — so
`fb-photo.png` ships 2400×3000. Layout is byte-identical to 1×; only the raster is denser.
Every platform downscales, so one hi-res file serves both screen and print.

Raise it with `SCALE=3 npm run posters -- <id>`, but only after the source assets can feed it —
past 2× the images, not the renderer, become the limit:

| Asset | Source | Largest use | Ceiling |
|---|---|---|---|
| speaker avatars | 400px | 150px | 2× (3× wants ≥600px) |
| `qr-eventpop.png` | 780px | 372px | 2× (3× wants ≥1200px) |
| `prompt-icon.png` | 256px | ~30px | 4× |

`PX` in each Meetup's `index.html` states the scale on the download button — keep it in sync
with `tools/generate-posters.sh`.

## The poster element

- Lives in the Meetup page inside a "Take the poster" section: size tabs → live preview →
  download link to the committed PNG.
- The `.poster` box switches mode by its own box aspect (container query / `data-mode`), so the
  on-screen render == the capture.

## Generate → review → commit

1. `npm run posters -- <id>` (Playwright): for each bucket, size the `.poster` element, screenshot
   that element → `meetups/<id>/posters/<name>.png`, plus a contact sheet.
2. Jun reviews each PNG. Wrong at a size → fix that mode's CSS, regenerate.
3. Commit approved PNGs. The live download serves them directly.

Never ship a bucket that wasn't eyeballed.
