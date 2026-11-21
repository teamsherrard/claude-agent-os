import json, os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import edits_drive as e
c = e.session()
R = os.path.join(os.path.dirname(os.path.abspath(__file__)), "research")
calls = {
 "capabilities": ("getCapabilities", {}),
 "catalog_kinds": ("listCatalogKinds", {}),
 "effects": ("listEffects", {}),
 "filters": ("listFilters", {}),
 "transitions": ("listTransitionsCatalog", {}),
 "text_animations": ("listTextAnimations", {}),
 "text_presets": ("listTextPresets", {}),
 "caption_styles": ("listCaptionStyles", {}),
 "speed_curves": ("listSpeedCurvePresets", {}),
 "fonts_tab_default": ("listFonts", {}),
 "music_royaltyfree": ("listMusicTracks", {"tab": "royalty-free", "license": "royaltyFree"}),
 "music_trending": ("listMusicTracks", {"tab": "trending"}),
 "sfx_transitions": ("searchSoundEffects", {"category": "transitions"}),
 "sfx_reactions": ("searchSoundEffects", {"category": "reactions"}),
 "sfx_cinematic": ("searchSoundEffects", {"category": "cinematic"}),
 "sfx_alerts": ("searchSoundEffects", {"category": "alerts"}),
 "sfx_whoosh": ("searchSoundEffects", {"query": "whoosh"}),
 "sfx_pop": ("searchSoundEffects", {"query": "pop"}),
 "sfx_click": ("searchSoundEffects", {"query": "click"}),
 "tts_voices": ("listTTSVoices", {}),
 "tracks": ("tracks", {}),
}
summary = {}
for key, (tool, args) in calls.items():
    try:
        r = e.call(c, tool, args)
    except Exception as ex:
        r = {"EXC": str(ex)}
    json.dump(r, open(os.path.join(R, key + ".json"), "w"), indent=1, default=str)
    t = r.get("text") if isinstance(r, dict) else r
    n = None
    if isinstance(t, dict):
        for k, v in t.items():
            if isinstance(v, list): n = (k, len(v)); break
    summary[key] = {"isError": r.get("isError") if isinstance(r, dict) else None, "list": n, "keys": list(t.keys())[:8] if isinstance(t, dict) else type(t).__name__}
    print(f"{key:20s} err={summary[key]['isError']} list={n} keys={summary[key]['keys']}")
