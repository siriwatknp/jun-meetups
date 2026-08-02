# Jun's Meetups

Static site for the meetups Jun hosts in Bangkok. Each **Meetup** is a self-contained page
with its own theme; the **Hub** (`/index.html`) lists them. Posters are pre-rendered locally
and committed. The site is **buildless** — plain HTML/CSS/JS; open `index.html` and it works.

## Structure

```
index.html                 Hub — lists all meetups (own neutral theme)
favicon.svg
meetups/<id>/
  index.html               the meetup page + poster view; data authored inline
  styles.css               this meetup's self-contained theme
  assets/                  speakers, sponsors, logo
  posters/                 committed poster PNGs (generated)
tools/generate-posters.sh  Playwright poster generator (dev-only)
package.json               dev tooling only — NOT a site build
CONTEXT.md                 glossary (terms: Meetup, Series, Theme, Poster…)
docs/adr/                  architecture decisions
.claude/rules/             the content-structure schema, poster + theme rules
```

## Add a meetup

1. Copy an existing `meetups/<id>/` (within a series, copy the prior edition to inherit its theme).
2. Fill the content inline per `.claude/rules/meetup-content-structure.md`.
3. Add a card to the Hub (`index.html`).
4. Generate + review posters (below).

## Posters

Sizes and workflow: `.claude/rules/poster-buckets.md` (why local: `docs/adr/0001`).

```
npm run posters -- <meetup-id>     # e.g. claude-code-3
```

Renders 4 PNGs (`fb-link` 1200×630, `ep-cover` 1200×628, `fb-photo` 1200×1500,
`ep-poster` 800×1132) into `meetups/<id>/posters/`. **Review each before committing** — the
live download serves these files directly (WYSIWYG: what you saw is the file).

Requires [`playwright-cli`](https://www.npmjs.com/) on PATH and a local Chrome.

## Run locally

```
python3 -m http.server 8140
# http://localhost:8140/
```

## Deploy (Vercel)

Deployed on Vercel as a static site (`vercel.json`: no build, output = repo root, cleanUrls).
Git integration is connected: pushes create preview deployments, `main` deploys to production
at https://jun-meetups.vercel.app. Manual deploy: `vercel --prod`.
