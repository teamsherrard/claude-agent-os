#!/usr/bin/env python3
"""build_reel.py — the house reel pass plan inside Instagram Edits for Mac, end to end.

  python3 -I build_reel.py plan  --clip ~/Movies/x.mov --name "My reel"
      imports, transcribes, maps pauses, prints the proposed cuts, beats, hook/CTA candidates. Nothing destructive.
  python3 -I build_reel.py build --clip ~/Movies/x.mov --name "My reel" --hook "..." --cta "..." [options]
      runs every pass, captures check frames, exports ONCE, verifies the file, prints the hand-back.

Options: --accent #hex (caption highlight)  --panel #hex (card pill)  --text #hex  --style Highlighter
         --pause 1.0 (min silence to cut)  --gain 3 (voice dB)  --music "title" | none  --music-db -18
         --zooms 4  --no-cut  --no-export  --fix "CLOD=Claude;clod=Claude"  --out ~/Movies/edits-exports
The token is read by the insta-edits bridge config; it is never printed."""
import argparse, json, os, re, subprocess, sys, time, statistics
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
import edits_drive as e

VIDEO_TRACK = None
def log(s): print(s, flush=True)
def _brain_home():
    """The agent's Brain folder: the Agent Attraction Brain when present, else the Realtor AI Brain (the Brain-home rule)."""
    for d in ("~/attraction-brain", "~/realtor-brain"):
        p = os.path.expanduser(d)
        if os.path.exists(os.path.join(p, "brain.md")):
            return p
    return os.path.expanduser("~/realtor-brain")


JOBS = os.path.join(_brain_home(), "editor", "jobs")
def checkpoint(pid, line):
    """Append one landed-pass line to the ed-<projectId>.md checkpoint log (the resume path reads it)."""
    try:
        os.makedirs(JOBS, exist_ok=True)
        with open(os.path.join(JOBS, f"ed-{pid}.md"), "a", encoding="utf-8") as f: f.write(line.rstrip() + "\n")
    except OSError: pass
def call(c, tool, args, must=True):
    r = e.call(c, tool, args); t = r.get("text", r)
    bad = r.get("isError") or (isinstance(t, dict) and t.get("ok") is False)
    if bad and must: raise SystemExit(f"!! {tool} {json.dumps(args)[:200]} -> {json.dumps(t)[:400]}")
    return t
def duck(c, mid, level):
    for i in range(4):
        r = e.call(c, "setDucking", {"id": mid, "behavior": "video", "level": level}); t = r.get("text", r)
        if not r.get("isError") and not (isinstance(t, dict) and t.get("ok") is False): return True
        time.sleep(2)
    log(f"  ducking not applied on {mid[:8]} after retries"); return False
def elements(c, **kw): return call(c, "elements", dict(limit=5000, **kw)).get("elements", [])
def pieces(c): return sorted([x for x in elements(c, trackId=VIDEO_TRACK) if x.get("trackType") == "video"], key=lambda x: x["startTime"])
def piece_at(c, t):
    for p in pieces(c):
        if p["startTime"] - 0.001 <= t < p["endTime"] + 0.001: return p
    return None
def comp_end(c): return max(p["endTime"] for p in pieces(c))
def find_words(t):
    if isinstance(t, dict):
        for k in ("words", "tokens", "segments", "transcript", "items"):
            v = t.get(k)
            if isinstance(v, list) and v and isinstance(v[0], dict) and "start" in v[0]: return v
            if isinstance(v, (dict, list)):
                w = find_words(v)
                if w: return w
    if isinstance(t, list):
        for x in t:
            w = find_words(x)
            if w: return w
    return []
def wtext(w): return w.get("text") or w.get("word") or ""
CUES = re.compile(r"(\$|\d|here'?s the thing|nobody|the truth|listen|secret|actually|but |problem|biggest|never|stop|mistake|\?|why |most people|the reason)", re.I)
CTA_RE = re.compile(r"(dm|link in (my )?bio|book|click|comment|follow|download|grab|message me|reach out|text me|call)", re.I)

def prep(c, a):
    global VIDEO_TRACK
    st = call(c, "appState", {})
    log(f"screen: {st.get('screen')}")
    pr = call(c, "newProject", {}); pid = pr.get("id"); log(f"project {pid}")
    call(c, "renameProject", {"id": pid, "name": a.name})
    call(c, "setProjectDynamicRange", {"range": "SDR"})
    call(c, "setCanvas", {"aspect": "9:16", "frameRate": 30})
    probe = call(c, "probeMedia", {"path": a.clip}); lu = call(c, "loudness", {"path": a.clip})
    log(f"clip: {probe.get('duration'):.1f}s {probe['video']['width']}x{probe['video']['height']} @{probe['video']['frameRate']:.0f} · {lu.get('integratedLufs'):.1f} LUFS peak {lu.get('samplePeakDb'):.1f} dB")
    m = call(c, "addMedia", {"path": a.clip}); clip = m["id"]; VIDEO_TRACK = m["trackId"]
    words = []
    for attempt in range(3):
        tr = call(c, "transcribeClip", {"id": clip, "language": "en", "background": False, "mergeSplitWords": True})
        words = find_words(tr)
        if words: break
        time.sleep(4)
    log(f"transcript: {len(words)} words")
    dur = probe["duration"]
    if a.start is not None or a.end is not None:   # repurpose: keep only the span
        s0, e0 = max(0.0, a.start or 0.0), min(dur, a.end or dur)
        if e0 > dur - 0.05: pass
        else:
            sp = call(c, "splitAt", {"id": clip, "times": [e0]}); tail = max(sp["pieces"], key=lambda x: x["start"])
            call(c, "selectById", {"id": tail["id"]}); call(c, "delete", {}); call(c, "clearSelection", {}); clip = min(sp["pieces"], key=lambda x: x["start"])["id"]
        if s0 > 0.05:
            sp = call(c, "splitAt", {"id": clip, "times": [s0]}); head = min(sp["pieces"], key=lambda x: x["start"])
            call(c, "selectById", {"id": head["id"]}); call(c, "delete", {}); call(c, "clearSelection", {}); clip = max(sp["pieces"], key=lambda x: x["start"])["id"]
        words = [dict(w, start=w["start"] - s0, end=w["end"] - s0) for w in words if s0 <= w["start"] < e0]
        dur = e0 - s0; log(f"span: {s0:.1f}-{e0:.1f}s kept ({dur:.1f}s)")
        checkpoint(pid, f"span · done · {s0:.1f}-{e0:.1f}")
    checkpoint(pid, f"brief · {a.name} · {os.path.basename(a.clip)} · {dur:.1f}s")
    return pid, clip, words, dur

def plan_cuts(c, clip, words, dur, a):
    pz = call(c, "findPauses", {"id": clip, "minDuration": a.pause, "thresholdDb": -45}).get("pauses", [])
    first = words[0]["start"] if words else 0; last = words[-1]["end"] if words else dur
    cuts = []
    if first > 0.35: cuts.append((0.0, max(0.0, first - 0.15), "lead-in"))
    for p in pz:
        s, en = p["start"], p["end"]
        if en <= first + 0.05 or s >= last - 0.6: continue
        if en - s >= a.pause: cuts.append((s + 0.12, min(en - 0.12, last - 0.3), "pause"))
    if dur - last > 0.7: cuts.append((last + 0.45, dur, "tail"))
    cuts = sorted([cu for cu in cuts if cu[1] - cu[0] >= 0.25])
    merged = []
    for cu in cuts:   # merge overlaps so a cut never lands twice on the same span
        if merged and cu[0] <= merged[-1][1] + 0.05: merged[-1] = (merged[-1][0], max(merged[-1][1], cu[1]), merged[-1][2] + "+" + cu[2])
        else: merged.append(cu)
    return merged

def context(words, t, n=5):
    before = [wtext(w) for w in words if w["end"] <= t][-n:]; after = [wtext(w) for w in words if w["start"] >= t][:n]
    return " ".join(before) + " | " + " ".join(after)

def apply_cuts(c, clip, cuts):
    removed = 0.0
    for (s, en, kind) in sorted(cuts, key=lambda x: -x[0]):
        p = piece_at(c, s) or piece_at(c, max(s, 0.0) + 0.01)
        if not p: log(f"  skip cut {s:.2f}-{en:.2f}: no piece"); continue
        if s <= p["startTime"] + 0.03:      # cut the head of this piece
            sp = call(c, "splitAt", {"id": p["id"], "times": [en]}); victim = min(sp["pieces"], key=lambda x: x["start"])
        elif en >= p["endTime"] - 0.03:    # cut the tail of this piece
            sp = call(c, "splitAt", {"id": p["id"], "times": [s]}); victim = max(sp["pieces"], key=lambda x: x["start"])
        else:
            sp = call(c, "splitAt", {"id": p["id"], "times": [s, en]}); victim = sorted(sp["pieces"], key=lambda x: x["start"])[1]
        call(c, "selectById", {"id": victim["id"]}); call(c, "delete", {}); call(c, "clearSelection", {})
        removed += en - s
    return removed

def main():
    ap = argparse.ArgumentParser(); ap.add_argument("mode", choices=["plan", "build", "resume"])
    ap.add_argument("--clip", default=""); ap.add_argument("--name", default="")
    ap.add_argument("--start", type=float, default=None, help="build only this span of the clip (seconds)"); ap.add_argument("--end", type=float, default=None)
    ap.add_argument("--hook", default=""); ap.add_argument("--cta", default="")
    ap.add_argument("--accent", default="#F5C542"); ap.add_argument("--panel", default="#1F1B2E"); ap.add_argument("--text", default="#FFFFFF")
    ap.add_argument("--style", default="Word Highlight Box"); ap.add_argument("--pause", type=float, default=1.0); ap.add_argument("--gain", type=float, default=1.5); ap.add_argument("--sfx", type=float, default=0.22); ap.add_argument("--hook-size", default="68")
    ap.add_argument("--music", default="auto"); ap.add_argument("--music-db", type=float, default=-26.0); ap.add_argument("--zooms", type=int, default=4)
    ap.add_argument("--no-cut", action="store_true"); ap.add_argument("--no-export", action="store_true"); ap.add_argument("--fix", default="CLOD=Claude;Clod=Claude;clod=Claude")
    ap.add_argument("--out", default=os.path.expanduser("~/Movies/edits-exports")); ap.add_argument("--cards", default=os.path.expanduser("~/Movies/edits-cards"))
    ap.add_argument("--hook-at", type=float, default=0.25); ap.add_argument("--popups", default="", help="extra pop-up cards: 'text@phrase;text2@phrase2' (3 s each, top zone)"); ap.add_argument("--beats", default="", help="|-separated caption indexes or phrases to zoom (overrides auto)")
    a = ap.parse_args()
    if a.mode != "resume" and not (a.clip and a.name): ap.error("--clip and --name are required for plan and build")
    a.clip = os.path.abspath(os.path.expanduser(a.clip)) if a.clip else ""
    c = e.session()
    global VIDEO_TRACK
    if a.mode == "resume":
        if call(c, "appState", {}).get("screen") != "editor": raise SystemExit("resume needs the project open in Edits")
        vids = [x for x in elements(c) if x.get("trackType") == "video"]; VIDEO_TRACK = vids[0]["trackId"]; clip = vids[0]["id"]
        pid, words, dur, cuts = "open project", [], comp_end(c), []
    else:
        pid, clip, words, dur = prep(c, a)
        cuts = plan_cuts(c, clip, words, dur, a)
    log("\n=== TRANSCRIPT ===\n" + " ".join(wtext(w) for w in words))
    log("\n=== PROPOSED CUTS ===")
    for s, en, kind in cuts: log(f"  {kind:7s} {s:6.2f}-{en:6.2f} ({en-s:4.2f}s)  …{context(words, s)}…")
    log(f"  total {sum(en-s for s,en,_ in cuts):.1f}s of {dur:.1f}s")
    cta_words = [w for w in words if CTA_RE.search(wtext(w))]
    log("\nCTA cue words: " + ", ".join(f"{wtext(w)}@{w['start']:.1f}" for w in cta_words[-6:]))
    if a.mode == "plan":
        log("\nplan only; project left open in Edits. Re-run with build --hook/--cta."); return

    # ---------- 1 CLEAN ----------
    removed = 0.0; zooms = []; whoosh_ids = []; cover = 0
    if a.mode == "resume":
        caps = call(c, "captions", {}); caps = caps.get("captions", caps) if isinstance(caps, dict) else caps; caps = sorted(caps, key=lambda x: x["startTime"])
        log(f"resume: {len(caps)} captions, {comp_end(c):.1f}s; running music → graphics → check → export")
    if a.mode != "resume" and not a.no_cut and cuts: removed = apply_cuts(c, clip, cuts)
    ps = pieces(c); end = comp_end(c)
    if a.mode != "resume":
      log(f"\nclean: removed {removed:.1f}s → {end:.1f}s in {len(ps)} pieces"); checkpoint(pid, f"clean · done · removed {removed:.1f}s · {len(ps)} pieces")
      for p in ps: call(c, "setSound", {"id": p["id"], "volumeDb": a.gain, "reduceNoise": 50, "enhanceVoice": 30})

    # ---------- 2 CAPTIONS ----------
    if a.mode != "resume":
      g = call(c, "generateCaptions", {"language": "en", "source": "video"}); log(f"captions: {g.get('generatedCount')}")
      call(c, "setCaptionStyle", {"style": a.style}); call(c, "setCaptionHighlightColor", {"color": a.accent})
      caps = call(c, "captions", {}); caps = caps.get("captions", caps) if isinstance(caps, dict) else caps
      caps = sorted(caps, key=lambda x: x["startTime"])
      fixes = [f.split("=", 1) for f in a.fix.split(";") if "=" in f]
      for cp in caps:
          new = cp["text"]
          for bad, good in fixes: new = re.sub(r"\b" + re.escape(bad) + r"\b", good, new)
          if new != cp["text"]: call(c, "editCaption", {"id": cp["id"], "text": new}); cp["text"] = new; log(f"  fixed caption: {new[:60]}")
      log("\n=== CAPTIONS (post-cut times) ===")
      for i, cp in enumerate(caps): log(f"  [{i:2d}] {cp['startTime']:6.2f}-{cp['endTime']:6.2f}  {cp['text']}")

    # ---------- 3 ENERGY ---------- (skipped on resume)
    if a.mode != "resume":
      zooms = []
      if a.beats:
          for tok in [x.strip() for x in a.beats.split("|") if x.strip()]:
              if tok.isdigit(): i = int(tok)
              else: i = next((k for k, cp in enumerate(caps) if tok.lower() in cp["text"].lower()), None)
              if i is None: log(f"  beat not found: {tok}"); continue
              zooms.append((caps[i]["startTime"], caps[i]["endTime"], 1.10 if re.search(r"\$|\d", caps[i]["text"]) else 1.06, caps[i]["text"]))
      else:
          cands = [(cp["startTime"], cp["endTime"], 1.10 if re.search(r"\$|\d|nobody|secret|truth", cp["text"], re.I) else 1.06, cp["text"]) for cp in caps if CUES.search(cp["text"]) and cp["startTime"] > 2.5]
          last_t = -99
          for z in cands:
              if len(zooms) >= a.zooms: break
              if z[0] - last_t >= 12: zooms.append(z); last_t = z[0]
      # never two in a row at the same size
      for i in range(1, len(zooms)):
          if zooms[i][2] == zooms[i-1][2]: zooms[i] = (zooms[i][0], zooms[i][1], 1.10 if zooms[i][2] == 1.06 else 1.06, zooms[i][3])
      whoosh_ids = []
      for (t0, t1, s, txt) in zooms:
          p = piece_at(c, t0)
          if not p: continue
          hold = min(max(t1 - t0, 2.5), 5.0, p["endTime"] - t0 - 0.1)
          if hold < 1.0: continue
          for (tt, sc) in ((t0, 1.0), (t0 + 0.06, s), (t0 + hold - 0.06, s), (t0 + hold, 1.0)):
              call(c, "setTransformKeyframe", {"id": p["id"], "time": round(tt, 3), "scale": sc, "x": 0.5, "y": 0.5})
          before = {x["id"] for x in elements(c)}
          call(c, "seek", {"seconds": t0}); call(c, "addSoundEffect", {"effect": "24752205027742799"}, must=False)
          new = [x for x in elements(c) if x["id"] not in before]
          for n in new: call(c, "setVolume", {"id": n["id"], "volume": a.sfx}); whoosh_ids.append(n["id"])
          log(f"  zoom {s:.2f} @ {t0:.2f}s hold {hold:.1f}s  “{txt[:50]}”")
      zoomed = {piece_at(c, z[0])["id"] for z in zooms if piece_at(c, z[0])}
      cover = 0
      for i, p in enumerate(pieces(c)):
          if i % 2 == 1 and p["id"] not in zoomed:
              call(c, "setTransformKeyframe", {"id": p["id"], "time": round(p["startTime"] + 0.01, 3), "scale": 1.06, "x": 0.5, "y": 0.5}); cover += 1
      log(f"energy: {len(zooms)} zooms, {cover} jump-cut covers, {len(whoosh_ids)} whooshes"); checkpoint(pid, f"captions · done · {len(caps)}"); checkpoint(pid, f"energy · done · {len(zooms)} zooms · {len(whoosh_ids)} whooshes")

    # ---------- 4 GRADE ---------- (skipped on resume)
    if a.mode != "resume":
      for p in pieces(c):
          for adj, v in (("brightness", 4), ("contrast", 12), ("saturation", 8)): call(c, "applyAdjust", {"id": p["id"], "adjust": adj, "value": v})
      log("grade: brightness +4 contrast +12 saturation +8 on every piece"); checkpoint(pid, "grade · done · +4 / +12 / +8")

    # ---------- 5 MUSIC ----------
    music_id = None
    if a.music != "none":
        prefs = [a.music] if a.music != "auto" else ["Unplayed Guitar", "Hypnotized (Instrumental)"]
        pick = None
        for pr in prefs:
            hits = call(c, "listMusicTracks", {"query": pr}).get("tracks", [])
            pick = next((t for t in hits if t.get("title", "").lower().startswith(pr.lower())), None)
            if pick: break
        if pick:
            before = {x["id"] for x in elements(c)}
            call(c, "seek", {"seconds": 0}); call(c, "addSongToComposition", {"audioAssetId": str(pick.get("audioAssetId") or pick.get("id"))})
            new = [x for x in elements(c) if x["id"] not in before]
            if new:
                music_id = new[0]["id"]
                call(c, "setSound", {"id": music_id, "volumeDb": a.music_db, "reduceNoise": 0, "enhanceVoice": 0})
                duck(c, music_id, 0.5); call(c, "setFade", {"id": music_id, "fadeIn": 0.8, "fadeOut": 1.5})
                if new[0]["endTime"] < comp_end(c) - 0.5:
                    before = {x["id"] for x in elements(c)}; call(c, "seek", {"seconds": new[0]["endTime"]}); call(c, "addSongToComposition", {"audioAssetId": str(pick.get("audioAssetId") or pick.get("id"))})
                    for n in [x for x in elements(c) if x["id"] not in before]:
                        call(c, "setSound", {"id": n["id"], "volumeDb": a.music_db, "reduceNoise": 0, "enhanceVoice": 0}); duck(c, n["id"], 0.5); call(c, "setFade", {"id": n["id"], "fadeIn": 0.8, "fadeOut": 1.5})
                log(f"music: {pick.get('title')} at {a.music_db} dB, ducking 0.5, fades 0.8/1.5, {new[0]['duration']:.0f}s")
        else: log("music: no matching royalty-free track; skipped")

    # ---------- 6 GRAPHICS ----------
    end = comp_end(c); graphics = []
    def native_card(text, at, duration, size):
        t = call(c, "addText", {"text": text, "atSeconds": at, "duration": duration}); tid = t["id"]
        call(c, "setTextStyle", {"id": tid, "size": size, "bold": True, "color": a.text, "alignment": "center"})
        call(c, "setEmphasis", {"id": tid, "style": "backgroundPill", "color": a.panel})
        call(c, "setTextAnimation", {"id": tid, "animation": "fligPop"}); call(c, "setTextPosition", {"id": tid, "x": 0.5, "y": 0.12})
        return tid
    if a.hook:
        bin_ = os.path.join(HERE, "render_card")
        if not os.path.exists(bin_): subprocess.run(["swiftc", "-O", os.path.join(HERE, "render_card.swift"), "-o", bin_], check=False)
        os.makedirs(a.cards, exist_ok=True); png = os.path.join(a.cards, re.sub(r"[^A-Za-z0-9]+", "-", a.name) + "-hook.png")
        ok = os.path.exists(bin_) and subprocess.run([bin_, png, a.hook, a.hook_size, a.text, a.panel, "HelveticaNeue-Bold", "1080", "1920", "0.13"], capture_output=True).returncode == 0
        o = None
        if ok:
            call(c, "seek", {"seconds": 0}, must=False)
            for attempt in range(2):
                o = call(c, "addOverlay", {"path": png, "startSeconds": a.hook_at, "x": 0.5, "y": 0.5, "scale": 1.0}, must=False)
                if isinstance(o, dict) and o.get("id"): break
                o = None; time.sleep(2)
        if o:
            call(c, "trim", {"id": o["id"], "side": "right", "deltaSeconds": 0.5}, must=False); graphics.append(("hook card PNG", o["id"]))
        else:
            graphics.append(("hook card native", native_card(a.hook, a.hook_at, 2.5, 26 if len(a.hook) <= 25 else 22)))
    if a.cta:
        cta_caps = [cp for cp in caps if CTA_RE.search(cp["text"])]
        start = cta_caps[-1]["startTime"] if cta_caps else max(end - 6, 0)
        graphics.append(("CTA", native_card(a.cta, start, max(end - start, 2.0), 26 if len(a.cta) <= 25 else 22)))
        log(f"CTA card from {start:.1f}s to the end")
    for spec in [x for x in a.popups.split(";") if "@" in x]:
        txt, phrase = spec.split("@", 1)
        cp = next((cp for cp in caps if phrase.lower() in cp["text"].lower()), None)
        if not cp: log(f"  card phrase not found: {phrase}"); continue
        graphics.append(("card " + txt[:20], native_card(txt, cp["startTime"], 3.0, 26 if len(txt) <= 25 else 22))); log(f"  card “{txt}” at {cp['startTime']:.1f}s")
    log(f"graphics: {len(graphics)} pieces"); checkpoint(pid, f"music · {'done' if music_id else 'skipped'}"); checkpoint(pid, f"graphics · done · {len(graphics)} pieces")

    # ---------- 7 CHECK + ONE EXPORT ----------
    times = [a.hook_at + 1.0] + [z[0] + 1.0 for z in zooms][:3] + ([max(end - 2.5, 0)] if a.cta else []) + [max(end - 0.3, 0)]
    times = sorted(set(round(min(t, end - 0.05), 2) for t in times))
    r = e.call(c, "captureFrame", {"times": ",".join(str(t) for t in times), "maxWidth": 540}); log("check frames: " + json.dumps(r.get("images")))
    summary = {"project": pid, "length": round(end, 1), "removed": round(removed, 1), "pieces": len(pieces(c)), "captions": len(caps), "zooms": [(round(z[0],1), z[2]) for z in zooms], "covers": cover, "music": bool(music_id), "whooshes": len(whoosh_ids), "graphics": [g[0] for g in graphics]}
    log("MEASURED: " + json.dumps(summary))
    if a.no_export: return
    os.makedirs(a.out, exist_ok=True); out = os.path.join(a.out, re.sub(r"[^A-Za-z0-9]+", "-", a.name) + ".mp4")
    if os.path.exists(out): os.remove(out)
    call(c, "setExportSettings", {"dynamicRange": "SDR", "resolution": "1080x1920", "resolutionType": "HD", "aspectRatio": "nineBySixteen", "quality": "High", "frameRate": 30})
    call(c, "export", {"path": out}); t0 = time.time()
    while True:
        st = call(c, "exportStatus", {}); 
        if st.get("state") in ("complete", "failed", "error", "cancelled"): break
        time.sleep(3)
    log(f"export {st.get('state')} in {time.time()-t0:.0f}s → {out}"); checkpoint(pid, f"export · {st.get('state')} · {out}")
    pr = call(c, "probeMedia", {"path": out}); lu = call(c, "loudness", {"path": out})
    log(f"file: {pr.get('duration'):.1f}s {pr['video']['width']}x{pr['video']['height']} @{pr['video']['frameRate']:.0f} audio={pr.get('hasAudio')} · {lu.get('integratedLufs'):.1f} LUFS peak {lu.get('samplePeakDb'):.1f} dB")
    sheet = e.call(c, "frameSheet", {"path": out, "times": ",".join(str(t) for t in times), "columns": min(len(times), 4), "cellWidth": 300}); log("export sheet: " + json.dumps(sheet.get("images")))
    json.dump({"summary": summary, "export": out, "frames": r.get("images"), "sheet": sheet.get("images"), "times": times}, open(os.path.join(HERE, "last_build.json"), "w"), indent=1)

if __name__ == "__main__": main()
