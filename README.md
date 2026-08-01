# Claude Code · Bangkok Meetup

Static site for the Claude Code Bangkok Meetup series — a free, community-run event
hosted by **Prompt โปวันๆ**. All content and assets live in this repo; no build step.

## Structure

```
index.html          One landing page: upcoming #3 → series stats → past #2, #1 → organizers
styles.css          Design system (tokens, pixel display type, the "stage horizon" glow)
main.js             Scroll-reveal only (page works fully without JS)
assets/
  logo.svg          Organizer mark
  speakers/         Speaker avatars (SVG placeholders — swap in real photos)
  sponsors/         Sponsor tiles
  gallery/          Event photos (SVG placeholders — swap in real photos)
```

## Editing content

Everything is plain HTML — edit `index.html` directly:

- **Upcoming edition** → the `.hero` section (`#next`). Update the date pill, lede, meta.
- **Past editions** → `<article class="edition">` blocks. `#2` holds real speaker/sponsor
  data from the poster; `#1` is placeholder text to fill from your archive.
- **Photos** → drop real images into `assets/gallery/` and point the `<img src>` at them.

## Run locally

```
python3 -m http.server 8000
# open http://localhost:8000
```

## Deploy (GitHub Pages)

Push to a public repo, then enable Pages → Deploy from branch → `main` / root.
`.nojekyll` is included so asset paths are served as-is.

## Design

Dark, cinematic backdrop with a signature glowing **stage horizon** rebuilt in pure CSS.
Pixel display (Silkscreen) for the poster title, IBM Plex Sans Thai for body (covers the
Thai talk titles), IBM Plex Mono for dates and labels.
