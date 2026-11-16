# Slides authoring (per Session)

The term is defined under Slides in `CONTEXT.md`. Reference implementation:
`meetups/claude-code-3/slides/ios-agentic-coding/`. Start new Slides by copying it, then
reskin to the Meetup's theme.

## Layout

```
meetups/<id>/slides/<session-id>/
  index.html        slides + the navigation script, inline
  styles.css        tokens copied by hand from the Meetup's styles.css
  fonts/            self-hosted woff2 subsets (latin + thai) + fonts.css
  assets/img/       stills, product shots, QR
  assets/logos/     tool and app marks
  assets/raw/       originals off the device: git-ignored, never deployed, README only
  clips/            encoded MP4 + poster JPG per demo
```

- Self-contained, same as `theme-authoring.md`: no imports from the Meetup page or other
  Slides. The theme comes from the Meetup, so the colors are the Meetup's colors.
- **No network while presenting.** Fonts, images and clips are all local files.

## Stage

- Fixed 1280×720 design canvas. `.stage` is the largest 16:9 box that fits the window,
  with `container-type:size`.
- One design pixel is `--u: 0.078125cqw` (100cqw / 1280). Size everything inside the
  stage as `calc(N*var(--u))`: type, spacing, borders, shadows. No `px`, `rem` or `vw`.
- Never reflow content for small screens. The stage scales and letterboxes.
- `.slide` has `overflow:hidden`, so a device that runs off one slide can't show on the next.

## Theme tokens

Copy the Meetup's tokens and keep the roles the same:

| Role | Token (CC3) | Use |
|---|---|---|
| Background | `--void` | stage |
| Heading | `--coral` | `.s-h2`, `.s-lead`, labels |
| Emphasis | `--flame` | `em`, `strong`, `.hot`, `.tag`, `code` |
| Body | `--bone` | main copy |
| Secondary | `--ash` | supporting lines, sub-copy |
| Quiet | `--ash-dim` | captions, mono labels, slide counter |
| Rules and arrows | `--coral-deep` | dividers, flow arrows, chip borders |
| Card border | `--line` | cards, stack rows, stills |
| Card fill | `rgba(21,12,9,.55)` | cards and nodes |

## Type

| Element | Font | Size (`--u`) |
|---|---|---|
| Title slide title | display font (Silkscreen at CC3) | 50 |
| Statement line `.s-lead` | sans 600 | 54, `.xl` 76 |
| Slide heading `.s-h2` | sans 600 | 38 (46 for `.lg` and meme, 56 for `.xl`) |
| Body `.s-body`, `.p-fix` | sans 400 | 20–21 |
| Supporting line `.s-sm` | sans 400 | 18 |
| Eyebrow, caption, counter | mono, uppercase, letter-spaced | 13–17 |

- The display font appears on the title slide only. At heading sizes it is hard to read,
  so every other heading uses the sans.
- Body font must cover Thai (IBM Plex Sans Thai at CC3).
- Cap copy width at `50ch`.

## Slide types

Pick one per slide. Each is a modifier on `.slide`.

| Type | Classes | Shape |
|---|---|---|
| Title | `.slide-title` | eyebrow (series + `#N`), title, speaker, role, date · venue |
| Statement | `.slide-statement` | one big line + one sub-line. `.xl` for the turning points of the talk |
| Solo | `.slide-clip.solo` | heading, one visual (rig row, tools, run, cards, stack, shot), one `.s-sm` line |
| Split | `.slide-clip.split` + `.pad-split` / `.phone-split` | copy left, device right. The iPad runs off the right edge; the iPhone stays whole |
| Problem and solution | split + `.p-label`, `.p-detail`, `.p-label.sol`, `.p-fix` or `.p-steps` | problem on top, fix under a divider |
| Meme | `.slide-clip.meme` | image and copy side by side, centred |
| Appendix | `.s-kicker.mono` "Appendix" + `.qr`, then solo step slides `Step N / M` | setup guide that people scan and read later |

## Copy

- One idea per slide. Slides you speak over carry very little text. Appendix slides may be dense,
  since people read them on their own device.
- Copy is Thai. Product, tool and feature names stay in English.
- Wrap a named product feature in running copy in `<span class="tag">`. Wrap a command,
  path or identifier in `<code>`.
- Write more than two steps as a numbered `.p-steps` list, not a paragraph.
- Wrap short parentheticals in `.nw` so they don't break across lines.

## Media

- Encode clips with `npm run clip -- <raw> <meetup-id> <session-id> <name>` (H.264,
  no audio, poster frame). Put the raw recordings in `assets/raw/` and keep its README listing
  the expected filenames. `.gitignore` covers every `assets/raw/`, but `.vercelignore` lists
  each one by path, so add the new one there.
- Wrap each recording in a CSS device frame (`.device.pad` / `.device.phone`). The captures
  have no hardware around them, so the frame shows what device it was.
- Size product shots by the visible device, not by the PNG box. Transparent margins differ
  between files.
- Put stills in `figure.shot` with a mono `figcaption`.
- QR codes stay dark on light so they scan off a projector.
- Optimize images with `npm run optimize` (it skips `assets/raw/` by itself).

## Navigation (keep the script from the reference)

- The track uses horizontal scroll-snap, so touch swipe works with no extra code.
- Next slide: Right, Down, PageDown, Space, Enter, N. Previous slide: Left, Up, PageUp,
  Backspace, P. Home and End jump to the first and last slide. F or F5 toggles fullscreen.
  B or `.` toggles a black screen. Presentation clickers send PageDown, PageUp, F5 and B.
- Clips never autoplay. On a slide with clips, each "next" press plays the next clip.
  After the last clip, "next" moves on. A clip started with the mouse counts as played.
  Leaving the slide pauses the clip without rewinding it.
- A video in fullscreen takes over the keyboard. Otherwise the slides always get the keys.
- `#N` in the URL opens slide N. The slide counter fades after 2.5 s so it stays out of photos.

## Quality floor

- Each `<section>` has `aria-label="Slide N: <what it says>"`. Decorative images use `alt=""`.
- `:focus-visible` outline on the track. `prefers-reduced-motion` switches scrolling to
  instant and makes the counter hide without fading.
- The page `<title>` is `<Session title> — <Meetup title>`. The OG image is the Meetup's
  `posters/fb-link.png`, and the favicon is the Meetup's.
- Link from the Meetup page (speaker card + schedule row, `Slides ↗`) only after the Session
  has been given.
