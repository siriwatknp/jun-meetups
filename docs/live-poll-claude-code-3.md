# Live poll — Claude Code Sharing #3

Question bank for the live poll at **Claude Code Sharing #3 · "Claude Code on Devices"**
(19 Aug 2026 · Agoda Thailand, One Bangkok).

Written to run during the **17:30–18:30 registration window** on the projector, and to give
**online viewers** something to join from the first minute. Bilingual: Thai first, English
under it — put both lines in the poll tool so the screen shows both.

- **11 questions**: 6 warm-up · 3 talk teasers (one per session) · 2 for the room + online.
- Each is tagged with a generic type — **multiple choice**, **multi-select**, **word cloud**,
  **scale**, **open text** — so it maps onto Slido, Mentimeter, or anything else.
- Spares at the bottom for the closing slot.

---

## Run of show

| Time | What's on screen | Questions |
|---|---|---|
| 17:30–17:50 | Doors open, room filling | A1 → A2 (easy, no thinking required) |
| 17:50–18:10 | Room half full, people settling | A3 → A4 (the fun ones — screenshots get shared) |
| 18:10–18:25 | Almost seated | A5 → A6 (sets up the whole night's theme) |
| 18:25–18:30 | MC opens, welcomes online viewers | C1 (who's here) — then leave **C2 (Q&A)** open all night |
| Before each talk | MC reads the result aloud, hands to speaker | B1 / B2 / B3 |
| 20:30 | Networking starts | Spares S1 / S2 |

Leave the join QR + room code on a corner of the slide the entire evening — people arrive late,
and online viewers scrub back.

---

## A · Warm-up (registration window)

### A1 — How long have you used Claude Code?
**Type:** multiple choice (single)

> **ใช้ Claude Code มานานแค่ไหนแล้ว?**
> How long have you been using Claude Code?

| TH | EN |
|---|---|
| ยังไม่เคยใช้ — มาดูก่อน | Haven't tried it yet — here to look |
| น้อยกว่า 1 เดือน | Less than a month |
| 1–6 เดือน | 1–6 months |
| มากกว่า 6 เดือน | More than 6 months |
| ใช้ทุกวันจนลืมพิมพ์โค้ดเอง | Every day — I've forgotten how to type code |

*Why:* zero-effort first vote, and it tells all three speakers how deep to go.

---

### A2 — Where do you run it from?
**Type:** multi-select (choose all that apply)

> **ตอนนี้คุณรัน Claude Code จากที่ไหนบ้าง? (เลือกได้หลายข้อ)**
> Where do you run Claude Code from today? (select all)

| TH | EN |
|---|---|
| Terminal บน laptop | Terminal on my laptop |
| IDE extension (VS Code / JetBrains) | IDE extension (VS Code / JetBrains) |
| มือถือ หรือ แท็บเล็ต | Phone or tablet |
| เครื่อง remote / cloud | A remote box or the cloud |
| CI หรือ GitHub Actions | CI or GitHub Actions |
| ยังไม่เคยรันเลย | Never run it |

*Why:* this is the thesis of the night in one chart — the laptop bar will tower over the rest,
and every speaker can point at it.

---

### A3 — One word
**Type:** word cloud

> **พิมพ์คำเดียว: Claude Code เปลี่ยนอะไรในงานคุณมากที่สุด**
> In one word: what has Claude Code changed most about your work?

*Why:* word clouds fill the screen fast and look alive while the room is still walking in.
Ask for **one word** explicitly or the cloud turns to mush.

---

### A4 — Strangest place
**Type:** multiple choice (single)

> **ที่แปลกที่สุดที่คุณเคยสั่ง agent ให้ทำงานคือที่ไหน?**
> What's the strangest place you've ever kicked off an agent from?

| TH | EN |
|---|---|
| บนเตียง ก่อนนอน | In bed, right before sleep |
| บน BTS / ตอนรถติด | On the BTS or stuck in traffic |
| ระหว่างประชุม (ปิดกล้องไว้) | During a meeting, camera off |
| บนเครื่องบิน / ตอนเที่ยว | On a plane or on holiday |
| ยังไม่เคยออกจากโต๊ะทำงาน | Never — always at my desk |

*Why:* the laugh of the night, and it lands the audience exactly where talk #1 and #2 start.

---

### A5 — How much is the agent writing?
**Type:** scale / multiple choice (single)

> **โค้ดที่คุณ merge ทุกวันนี้ มาจาก agent ประมาณกี่ %?**
> Roughly what % of the code you merge is written by an agent?

| TH | EN |
|---|---|
| 0% | 0% |
| 1–25% | 1–25% |
| 26–50% | 26–50% |
| 51–75% | 51–75% |
| 76–100% | 76–100% |

*Why:* the number people are most curious about each other's answer to. Great MC moment.

---

### A6 — What keeps you at the desk?
**Type:** multiple choice (single)

> **อะไรที่ทำให้คุณยัง "ต้องกลับมานั่งที่โต๊ะ"?**
> What still forces you back to your desk?

| TH | EN |
|---|---|
| ต้องอ่าน diff บนจอใหญ่ | I need to read the diff on a big screen |
| ต้อง approve ทุก tool call | Approving every tool call |
| secrets / VPN / เข้าเครื่องบริษัทไม่ได้ | Secrets, VPN, can't reach the company box |
| กลัว agent ไปแตะ prod | Scared the agent touches prod |
| setup บนอุปกรณ์อื่นยุ่งยากเกิน | Setting it up elsewhere is too much work |

*Why:* this is the problem statement for all three talks. Hand the result straight to the MC
as the transition line into the first session.

---

## B · Talk teasers (run right before each session)

### B1 — before "Leveraging iOS ecosystem for agentic coding" (จุ้น · MUI)
**Type:** multiple choice (single)

> **งานแบบไหนที่คุณ "ยอม" ทำจากมือถือ?**
> What kind of work would you actually do from your phone?

| TH | EN |
|---|---|
| รีวิว PR / อ่าน diff | Review a PR, read a diff |
| ตามแก้ CI ที่พัง | Chase down a broken CI run |
| สั่งงานใหม่แล้วปล่อยให้รัน | Kick off a new task and let it run |
| คุยกับ agent เก็บไอเดีย | Talk to the agent to shape an idea |
| ไม่ยอมทำอะไรเลย จอเล็กไป | Nothing — the screen is too small |

---

### B2 — before "Work anywhere with Claude Code in the cloud" (หนุ่ม · Eventpop, TokenMe)
**Type:** word cloud (or open text)

> **ถ้า Claude Code รันบน cloud ได้ 24 ชม. คุณจะให้มันทำอะไรตอนคุณหลับ?**
> If Claude Code ran in the cloud 24/7, what would you have it do while you sleep?

*Why:* open-ended on purpose — the answers become the speaker's demo checklist, and the
audience recognises their own words on screen.

---

### B3 — before "Managing Multiple Coding Agents with Orca ADE" (พี · Envisso)
**Type:** multiple choice (single)

> **ปกติคุณรัน agent พร้อมกันกี่ตัว?**
> How many agents do you normally run at once?

| TH | EN |
|---|---|
| 1 ตัว — พอแล้ว | Just 1 — that's plenty |
| 2–3 ตัว | 2–3 |
| 4–6 ตัว | 4–6 |
| มากกว่า 6 ตัว | More than 6 |
| เคยลองหลายตัว แล้วมั่วจนเลิก | Tried many, got lost, gave up |

*Why:* the "gave up" bucket is the whole reason the talk exists. Read that number out loud.

---

## C · The room + online viewers

### C1 — Where are you watching from?
**Type:** multiple choice (single)

> **คุณอยู่ที่ไหนตอนนี้?**
> Where are you right now?

| TH | EN |
|---|---|
| ในห้อง ที่ One Bangkok | In the room at One Bangkok |
| ดูออนไลน์ อยู่บ้าน | Watching online from home |
| ดูออนไลน์ อยู่ที่ออฟฟิศ | Watching online from the office |
| ดูย้อนหลัง (สวัสดีจากอนาคต 👋) | Watching the replay — hi from the future 👋 |

*Why:* one question that makes online viewers visible to the room. The MC greeting them by
count is the cheapest way to keep them engaged all night.

---

### C2 — Ask the speakers
**Type:** open text / audience Q&A with upvoting — **leave open the whole evening**

> **มีคำถามอะไรอยากถามสปีกเกอร์? พิมพ์ไว้ได้เลย แล้วโหวตคำถามที่อยากให้ตอบ**
> Got a question for the speakers? Drop it in and upvote the ones you want answered.

*Why:* the highest-value item here. Onsite people are shy about raising a hand and online
viewers can't. Sort by upvotes and let the MC read the top 3 after each talk.

---

## Spares (closing / networking)

**S1 — next edition topic** · word cloud
> **อยากให้ #4 พูดเรื่องอะไร?** / What should #3's sequel be about?

**S2 — takeaway** · multiple choice
> **คืนนี้คุณจะกลับไปลองอะไรก่อน?** / What will you try first when you get home?
> — รัน Claude Code จากมือถือ / ย้ายไปรันบน cloud / ลองหลาย agent พร้อมกัน / ต่อเข้า CI / ยังไม่แน่ใจ
> — Run it from my phone / Move it to the cloud / Run several agents / Wire it into CI / Not sure yet

---

## Notes for whoever runs it

- **Keep the question line short.** Anything past roughly 60 Thai characters wraps badly on a
  projector at the back of the room. Options: 5 max, one line each.
- **Thai first, English second**, same order everywhere — people scan for their language by
  position, not by reading both.
- **Show results live** for A-block questions (it's the point) and for B-block only after the
  MC has read the question aloud, so the first votes don't anchor the rest.
- **Reset between the room and online.** If you want a clean per-question count, don't reuse a
  poll — duplicate it.

### If you use Slido

Slido runs live: votes land on the presenter screen in real time, and its audience Q&A supports
upvoting, which is exactly what C2 needs.

One thing to check before the night: **the free tier is reported to cap an event at 3 polls
(and around 100 participants)** — Q&A is unlimited. This bank has 11 questions, so on a free
account you'd need a paid plan, or split the questions across several Slido events (each with
its own join code — clunky mid-event). I couldn't reach slido.com from here to confirm against
the official pricing page; the figures come from third-party write-ups, so verify on
[slido.com/pricing](https://www.slido.com/pricing) before committing to a plan.

Mentimeter has similar per-presentation limits on its free tier. Worth checking the same way.
