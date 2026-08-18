# Drop raw talk assets here

Originals only — straight off the iPad/iPhone, no editing, no compression.
This folder is git-ignored and never deployed, so file size doesn't matter.

Use these exact filenames. Extension can be whatever your device produced
(`.mov`, `.mp4`, `.png`, `.jpg`, `.heic`) — I'll transcode.

## Videos — 4

| Filename | Slide | Shot | Length | Capture |
|---|---|---|---|---|
| `01-blink-connect` | 9 | Open Blink → connect to the Mac → Claude Code → Agent View → switch session → create a new one | ~50s | iPad **landscape** |
| `02-screenshot-to-messages` | 13 | Agent finishes on the Mac → screenshot lands in Messages | ~20s | iPad portrait |
| `03-pencil-check-tray` | 14 | **Hero.** Screenshot → Apple Pencil annotate → Share → Save to Files → Blink → type "check tray image" → agent replies | ~45s | iPad portrait |
| `04-preview-link` | 15 | iMessage arrives with the preview link → tap → Chrome opens | ~15s | iPhone portrait |

Recording notes:
- **No audio needed** — it gets stripped. You narrate live.
- Make Pencil strokes and any tapped UI big enough to read from the back of a room.
- Trim dead time at the head and tail before dropping; every second shows on screen.
- Keep each clip to the length above. These play while you talk over them.

## Images — 2

| Filename | Slide | What |
|---|---|---|
| `meme-close-the-lid` | 2 | The "You cannot close the lid" meme. Landscape, ~900×420 or larger. |
| `ipad-at-cc2` | 5 | พี่ทาย's iPad setup at Claude Code Sharing #2. **Ask him first.** Slide works without it. |

## Optional

| Filename | Where | What |
|---|---|---|
| `files-app-icon` | — | iOS Files.app icon, 1024×1024. Only if we add an ecosystem slide showing app icons. |

## What happens next

Drop the files, tell me, and I'll run each video through:

```
npm run clip -- assets/raw/<name>.mov claude-code-3 ios-agentic-coding <name>
```

which transcodes to H.264 MP4 (`yuv420p`, audio stripped, ≤1280px wide), writes a poster
frame, and lands both in `../../clips/`. Images get placed in `../img/`. Then I swap the
dashed placeholders in `index.html` for the real thing and redeploy the preview.
