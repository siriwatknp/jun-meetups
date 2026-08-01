# Meetup content structure (the data template)

The invariant every Meetup shares. See `CONTEXT.md` for terms. Data is authored **inline in
each Meetup's `index.html`** (no build, no JSON). This doc is the schema; the HTML is the
filled instance. Visual arrangement is free per Theme — only the presence of these
sections + their data is required.

## Fields

| Field | Req | Notes |
|---|---|---|
| `id` | ✓ | slug = folder name, e.g. `claude-code-3` |
| `series` | – | grouping label, e.g. "Claude Code Sharing" |
| `edition` | – | number within series |
| `title` | ✓ | e.g. "Claude Code Sharing #3" |
| `tagline` | ✓ | short theme line, e.g. "Claude Code on Devices" |
| `description` | ✓ | 1–2 sentences (page body + OG/meta) |
| `status` | ✓ | derived from `date` vs today: `upcoming` \| `past` (explicit override allowed) |
| `format` | ✓ | `offline` \| `online` \| `hybrid` (default offline) |
| `price` | ✓ | default "free" |
| `date` | ✓ | `{ start, end?, tz: "Asia/Bangkok" }`; single day |
| `venue` | ✓ | `{ name, address?, mapUrl?, image? }` |
| `registerUrl` | – | upcoming only; "TBA" allowed |
| `speakers[]` | ✓ | `{ id, name, role, company, avatar }` — no socials |
| `sessions[]` | ✓ | `{ id, title, abstract?, speakerIds[] }` — 1+ speakers |
| `schedule[]` | – | ordered `{ time, label, sessionId? }`; non-talk rows have no session |
| `sponsors[]` | – | `{ name, logo, url?, tier? }`; flat, optional tier |
| `organizers[]` | ✓ | `{ name, logo, role }`; per-Meetup |
| `gallery[]` | – | past Meetups only: `{ image, alt }` |

## Rules

- A **Session** is given by 1+ **Speakers**; a Speaker may give multiple Sessions.
- A **Schedule** item references 0 or 1 Session (reuse the Session title, don't retype).
- **TBA**: unknown values render as an explicit "TBA" state, never blank.
- **status** drives the page: `upcoming` → register CTA; `past` → gallery/recap.

## OG / meta (per Meetup)

Each `index.html` sets its own `<title>`, `<meta name="description">`, and OG/Twitter tags
(image = the Eventpop Cover or FB Link poster PNG). Buildless, so authored by hand.
