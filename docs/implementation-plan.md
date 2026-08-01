# Implementation Plan — Jun's Meetups

> Status: Phases 0–4 ✅ Done (Hub + `claude-code-3` + posters). Phases 5–6 pending (#2/#1 recaps, final ship).

Static site hosting Jun's meetups. Buildless site; author-time poster tooling. Decisions
captured in `CONTEXT.md` and `docs/adr/`. Data authored inline per Meetup; each Meetup is a
self-contained page + Theme; posters pre-rendered locally and reviewed before publish.

## Phase 0 — Capture decisions as docs

- [x] `docs/adr/0001-posters-prerendered-locally.md` — posters are pre-rendered locally with
      a real headless browser and committed as static PNGs; live download serves the file.
      Rejected: client-side runtime capture (`html-to-image`) — fidelity risk on fonts/
      gradients/SVG, JS-dependent.
- [x] `.claude/rules/meetup-content-structure.md` — the data template (the invariant):
      the required sections + fields, cardinalities, TBA handling. Annotated example.
- [x] `.claude/rules/poster-buckets.md` — the 4 sizes / 3 layout modes, the WYSIWYG rule,
      the generate → review → commit workflow, naming of PNG files.
- [x] `.claude/rules/theme-authoring.md` — per-Meetup self-contained Theme; copy-within-Series;
      quality floor (responsive, visible focus, prefers-reduced-motion); no shared stylesheet.

## Phase 1 — Reset & rename

- [x] `gh repo rename jun-meetups`; rename local dir; update `origin`.
- [x] Delete current `index.html`, `styles.css`, `main.js`, `assets/` (throw away).
- [x] Keep `.git`, `.gitignore`, `.nojekyll`, `CONTEXT.md`, `docs/`, `.claude/`.
- [x] New skeleton: `meetups/`, `tools/`, `.claude/rules/`, `docs/adr/`.
- [x] `package.json` (dev dep: `playwright`); gitignore `node_modules/`. Site stays buildless;
      Playwright is author-time only, never shipped.
- [x] Rewrite `README.md` (new model, how to add a Meetup, how to generate posters).

## Phase 2 — Poster tooling

- [x] `tools/generate-posters.mjs`: given a Meetup id, open its page, and for each bucket
      set the poster element to the bucket size and screenshot THAT element (WYSIWYG) →
      `meetups/<id>/posters/<name>.png`.
- [x] Buckets (3 modes, 4 files):
      - `fb-link`   1200x630   landscape 1.91:1
      - `ep-cover`  1200x628   landscape 1.91:1 (same mode)
      - `fb-photo`  1200x1500  portrait 4:5
      - `ep-poster` 800x1132   portrait A-series ~1:1.41
- [x] Poster element switches mode via container query / `data-aspect` on its own box, so the
      on-screen render at a bucket size == the captured PNG.
- [x] `npm run posters -- <id>` generates all 4 + a contact-sheet for review.
- [x] Review gate: Jun eyeballs each PNG; fix that mode's CSS and regenerate until approved.

## Phase 3 — Hub (`/index.html`)

- [x] Lists all Meetups: upcoming highlighted, past below. Own self-contained theme.
- [x] Cards link to `meetups/<id>/`. Derives upcoming/past from each Meetup's date.

## Phase 4 — Meetup: `claude-code-3` (upcoming)

- [x] Build from scratch per content structure: browsing page + poster view (3 modes) +
      Theme CSS, data inline. Placeholder assets where real ones are unknown (venue, register).
- [x] Handle TBA fields (date/venue/speakers may be unannounced).
- [x] Generate + review 4 posters.

## Phase 5 — Meetup: `claude-code-2` (past)

- [ ] Copy `claude-code-3` Theme (same Series), tweak values.
- [ ] Real data: speakers ไก่ (Eventpop) / ปั่น (Paypers), sessions, sponsors (Cleverse,
      income in click, HEY PRO!, Claude Thailand Community), gallery. status = past.
- [ ] Generate + review 4 posters.

## Phase 6 — Verify & ship

- [ ] Serve locally; screenshot Hub + each Meetup (desktop + mobile); check focus rings,
      reduced-motion, no console errors.
- [ ] Commit; push; (optional) enable GitHub Pages.

## Open questions

1. Scope now: build `claude-code-1` too (past), or only #2 + #3?
2. Hub theme: neutral personal-brand, or lean the Claude-Code aesthetic for launch?
3. Poster preview: show the poster view live on the Meetup page (size tabs + download),
   or keep the preview dev-only and expose only download links on the live page?
4. `claude-code-3` register link + date/venue: real values, or all TBA placeholders?
5. Sessions for #3: known speakers yet, or TBA?
