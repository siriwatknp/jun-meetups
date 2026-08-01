# Theme authoring (per Meetup)

Each Meetup is a self-contained page: its own `index.html` + `styles.css` + `assets/`.
**No site-wide stylesheet.** The only shared things are the content structure (docs) and the
poster tooling (`tools/`).

## Rules

- **Self-contained.** All CSS for a Meetup lives in its own `styles.css`. Do not import or
  depend on another Meetup's or the Hub's styles.
- **Copy within a Series.** A new edition starts by copying the prior edition's `styles.css`
  and tweaking values — visual continuity without a live shared file.
- **Theme is free; structure is not.** Arrange/skin sections however the theme wants, but every
  Meetup must contain the required sections + data (see `meetup-content-structure.md`).
- **The poster shares the theme.** The `.poster` composition uses the same `styles.css` and data
  as the page — one source of truth for the artwork.

## Quality floor (every Meetup + the Hub)

- Responsive to mobile; body never scrolls horizontally.
- Visible keyboard focus (`:focus-visible`).
- `prefers-reduced-motion: reduce` respected.
- Theme-legible text contrast; no console errors.
