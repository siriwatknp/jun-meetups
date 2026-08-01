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
