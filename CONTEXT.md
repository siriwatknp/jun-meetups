# Jun's Meetups

A static site hosting the meetup events Jun hosts. Each event has structured content
and its own visual theme, plus a downloadable poster. Not tied to any single topic.

## Language

**Meetup**:
A single dated event — the atomic unit of the site. Owns its own content, Theme, and Poster.
Rendered as a self-contained page (own HTML + CSS + assets); no site-wide stylesheet.
_Avoid_: Event (too generic), Edition.

**Series**:
A grouping label shared by related Meetups (e.g. "Claude Code"). A string tag, not a
structural parent — Meetups are a flat list. A later Meetup in a Series inherits the prior
one's Theme by copying its CSS, then tweaking values.
_Avoid_: Track, Program.

**Content structure**:
The invariant every Meetup shares — the set of sections and the data behind them
(title, description, date & time, venue, speakers & sessions, schedule, sponsors).
Shared by convention + docs (`.claude/rules/`), NOT by shared code. This is the contract.
_Avoid_: Layout (ambiguous — see Flagged ambiguities).

**Theme**:
A Meetup's visual treatment — its CSS, arrangement, type, color, tone. Per-Meetup and
fully self-contained. Two Meetups may satisfy the same Content structure while looking
entirely different (e.g. speakers as a list vs a grid).
_Avoid_: Skin, Style (as a noun).

**Hub**:
The landing page listing all Meetups. Entry point to each Meetup's own page.
_Avoid_: Home, Index.

**Poster**:
A downloadable image render of a Meetup at one of a fixed set of named sizes (aspect
buckets). Pre-rendered locally with a real headless browser, reviewed by Jun, and committed
as static PNGs; the live download serves the file directly (no runtime generation). What is
captured is exactly the on-screen poster view (WYSIWYG).
_Avoid_: Flyer, Card.

**Speaker**:
A person who gives one or more Sessions at a Meetup. `name`, `role`, `company`, `avatar`.
No social links.
_Avoid_: Presenter, Guest.

**Session**:
A talk. `title`, optional `abstract`, and one or more Speakers. Renders as the poster/page
speaker cards (shown without times).
_Avoid_: Talk (alias ok), Slot.

**Schedule**:
A Meetup's timeline — ordered items, each `{ time, label, session? }`. Talk rows reference a
Session (so titles aren't retyped); non-talk rows (registration, break, networking) have none.
_Avoid_: Agenda (alias ok), Timeline.

## Relationships

- The **Hub** lists many **Meetups**
- A **Meetup** optionally carries one **Series** label
- A **Meetup** has exactly one **Theme** (self-contained; copied from prior edition within a Series)
- A **Meetup** conforms to the one shared **Content structure**
- A **Meetup** produces a set of **Posters** (one per aspect bucket)
- A **Session** is given by one or more **Speakers**; a **Speaker** may give multiple **Sessions**
- A **Schedule** item references zero or one **Session**

## Flagged ambiguities

- "meetup" vs "event" — resolved: **Meetup** is the event; the repo is "Jun's Meetups".
- "series" implied a parent entity — resolved: it's a flat label, not a structural parent.
- "layout stays the same" — resolved: the invariant is **Content structure** (sections + data),
  NOT the visual layout. Visual arrangement belongs to the per-Meetup **Theme** and may differ.
