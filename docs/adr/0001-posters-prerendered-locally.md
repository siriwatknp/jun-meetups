# Posters are pre-rendered locally and committed, not generated at runtime

Each Meetup exposes downloadable Posters at a fixed set of named sizes (aspect buckets).
We generate them **author-time** with a real headless browser (Playwright), Jun reviews each
PNG, and the approved files are committed under `meetups/<id>/posters/`. The live page's
download control just serves the static PNG — no client-side capture, no server.

## Why

- **Fidelity.** Client-side `html-to-image`/`html2canvas` misrender exactly what our themes lean
  on — web fonts, layered gradients, `text-shadow`, SVG. A real browser screenshot is pixel-exact.
- **Static hosting.** No runtime/backend; works as-is on GitHub Pages.
- **Human gate.** A poster is public-facing; Jun approves every size before it ships.

## Trade-off accepted

- Sizes are a curated set, not arbitrary. Adding a size = add a bucket + regenerate.
- Content changes require re-running generation. That's the point — review is intentional.

## Rejected

- Client runtime capture (flexible, any size) — fidelity risk + JS-dependent + no review gate.
