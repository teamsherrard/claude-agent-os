# Edits catalogs (dumped live from Edits for Mac 456.0.0 on 2026-11-21)

Re-dump with `scripts/edits/dump_catalogs.py` after an Edits update; names below are the exact strings the apply tools accept.

## Conventions (from getCapabilities)
- **color**: #RRGGBB or #RRGGBBAA
- **canvas**: Normalized 0-1, origin top-left, +y down, x/y = element centre
- **time**: Seconds on the composition timeline, unless a param name says otherwise (*SourceSeconds = source-asset seconds, *Ms = milliseconds)
- **rotation**: Degrees clockwise

## Catalog kinds → apply tool
- transition → `addTransition` (51)
- videoEffect → `applyEffect` (148)
- filter → `applyFilter` (77)
- lut → `applyLUT` (16)
- textAnimation → `setTextAnimation` (77)
- textPreset → `applyTextPreset` (34)
- captionStyle → `setCaptionStyle` (39)
- speedCurvePreset → `selectSpeedPanelPreset` (8)
- font → `setTextFont` (377)
- emphasisStyle → `setEmphasis` (5)
- maskShape → `setMask` (5)

## Video effects — `applyEffect(id, effect)` (148; 'none' clears)
Useful on a talking head (sparingly): video_zoom_in, video_push_zoom, video_pulse_zoom, video_blur_in/out, video_fade_in/out, video_film_grain, video_soft_flicker. Avoid shake/glitch/party on realtor content.

none, video_shake, video_super_shake, video_handheld, video_handheld_zoom, video_handheld_flash, video_wavy, video_spin, video_roll, video_steady_in, video_steady_out, video_drift_up, video_drift_down, video_flip, video_bounce, video_tilt, video_swipe_up, video_roulette, video_swerve, video_frame_tilt, video_frame_flip, video_dust, video_pan_around, video_bulge, video_super_wobble, video_wave_loop, video_compress, video_bulge_2, video_path, video_zoom_in, video_zoom_out, video_super_zoom, video_push_zoom, video_zoom_bounce, video_pulse_zoom, video_infinite_zoom, video_zoom_shake, video_bw_zoom, video_grid_zoom, video_grid_expand, video_grid_collage, video_stack_collapse, video_stack, video_super_cut, video_super_pulse, video_infinite_rotate, video_blur_in, video_blur_out, video_blur_pulse, video_focus_switch, video_bw_fade_out, video_stretch_blur, video_horizontal_open, video_blackout, video_spin_in, video_soft_mask_in, video_displace_in, video_glitch_2_in, video_soft_mask_out, video_displace_out, video_glitch_2_out, video_blur_fade, video_blur_fade_in, video_blur_fade_out, video_particles_in, video_particles_out, video_hue_shift, video_trippy, video_color_shift, video_bw_pulse, video_chromatic_pulse, video_color_wipe, video_color_echo, video_color_echo_extreme, video_color_shutter, video_color_pulse, video_flicker, video_soft_flicker, video_exposure_pulse, video_flashing_lights, video_lense_flare, video_light_ray, video_party_lights, video_exposure_fade, video_sparkle, video_bling, video_film_grain, video_pixelate, video_pixel_in, video_pixel_out, video_glitch, video_static_grid, video_simple_blur, video_mirror_horizontal, video_mirror_vertical, video_kaleidoscope, video_stretch, video_clones, video_slice, video_slow_shutter, video_tunnel_vision, video_low_res, video_film, video_washed_out, video_chroma_blur, video_fisheye, video_prism, video_infinite_grid, video_popups, video_crafty, video_mirror_frames, video_exposure_stretch, video_frame_short, video_frame, video_plain_frame, video_blur_frame, video_fade_in, video_fade_out, oscars_2026_zoom, oscars_2026_pan, oscars_2026_frame_in, oscars_2026_frame, oscars_2026_circle_intro, video_cutout_blur, video_cutout_pixel, video_cutout_outline, video_cutout_shimmer, video_cutout_dither, video_cutout_explode, video_cutout_pulse, video_cutout_scribble, video_cutout_sparkles, cutout_resize, video_cutout_flicker, video_cutout_inner_glow, video_cutout_outer_glow, video_cutout_light_ray, video_cutout_negative_flash, video_cutout_exposure_pulse, video_cutout_color_wipe, video_cutout_color_echo, video_cutout_clone_slide, video_cutout_shake, video_cutout_nod, video_cutout_float, video_cutout_scatter_brain, video_cutout_fade_away, video_cutout_raw_mask

## Filters — `applyFilter(id, filter, intensity)` (77; 'normal' clears)
Safe picks: subtle, subtle_warm, subtle_cool, soft_light, boost (strong), los_angeles. Use `applyAdjust` for the doctrine grade instead of a filter.

normal, subtle, boost, oslo, paris, jakarta, lut_spark1, lut_spark2, lut_spark3, color_wide_lut11, color_wide_lut19, color_wide_lut7, fade, new_york, oscars_2026_filter, lut_spark4, lut_spark5, lut_spark6, lut_spark7, lut_spark8, color_wide_lut2, color_wide_lut25, color_wide_lut26, color_wide_lut3, color_wide_lut10, color_wide_lut20, subtle_cool, fade_cool, boost_cool, color_wide_lut12, color_wide_lut15, color_wide_lut9, subtle_warm, boost_warm, fade_warm, los_angeles, abu_dhabi, lut_spark9, color_wide_lut5, color_wide_lut18, color_wide_lut1, soft_light, buenos_aires, cairo, jaipur, melbourne, lagos, color_wide_lut22, color_wide_lut13, midnight, lut_spark10, lut_spark11, lut_spark12, lut_spark13, color_wide_lut8, color_wide_lut4, color_wide_lut23, grayscale, gritty, tokyo, color_wide_lut14, color_wide_lut6, color_wide_lut16, hyper, emerald, handheld, color_leak, grainy, zoom_blur, halo, rosy, lut_spark14, lut_spark15, rio_de_janeiro, color_wide_lut21, color_wide_lut17, color_wide_lut24

## Transitions — `addTransition(fromId, toId, filterId, durationSeconds)` (51; 'normal' removes)
On a single-camera talking head: none, or `transition_dissolve` 0.2–0.3 s at most. The catalog:

normal, transition_dissolve, transition_zoom_in, transition_fade, transition_wipe_timeline, transition_fade_flicker, transition_pan_down, transition_zoom_out, transition_blur, transition_shake, transition_pan_right, transition_flare, transition_wipe_up, transition_wipe_clock, transition_wipe_circle_in, transition_pan_up, transition_wipe_circle_out, transition_wipe_down, transition_pan_left, transition_wipe_right, transition_wipe_left, transition_exposure, transition_shake_zoom, transition_spin, transition_swirl, transition_slide_up, transition_slide_down, transition_slide_left, transition_slide_right, transition_slide_bounce, transition_zoom_bounce, transition_stretch, transition_stretch_vertical, transition_zoom_warp, transition_zoom_in_out, transition_pan_around, transition_cube, transition_scanner_vertical, transition_rotate_warp, transition_ripple, transition_quick_pan, transition_datamosh, transition_light_wipe, transition_wipe_oval_in, transition_wipe_oval_out, transition_pixel, transition_frames, transition_checkerboard, transition_scanner, transition_blink, transition_morph

## Text animations — `setTextAnimation(id, animation)` (77)
Calm picks: fadeIn, fligPop, fligSlowZoom, fligHeadline, fligStamp, slideInLeft, fligFadeUpWord. Exits: fligBounceOut, fligSlideOut, fligSlowFade.

none (None), typewriter (Typewriter), bounceIn (Bounce In), fadeIn (Fade In), scaleIn (Scale In), slideInLeft (Slide Left), slideInRight (Slide Right), fligCaptionIdentity (Caption), fligEffectOnly (Effect Only), fligCaptionFade (Caption Fade), fligCaptionPop (Caption Pop), fligCaptionSlide (Caption Slide), karaoke (Karaoke), wave (Wave), glitch (Glitch), fligHop (Hop), fligSlowZoom (Slow Zoom), fligZoomBounce (Zoom Bounce), fligShrink (Shrink), fligVanish (Vanish), fligExpand (Expand), fligSeesaw (Seesaw), fligHover (Hover), fligBlowUp (Blow Up), fligPop (Pop), fligJump (Jump), fligStepFade (Step Fade), fligStepByStep (Step by Step), fligVerticalFade (Vertical Fade), fligSlideWord (Slide Right), fligFloatWord (Float), fligFlickerWord (Flicker), fligFallWord (Fall), fligFadeUpWord (Slide Up), fligDriftUp (Drift Up), fligEmphasize (Emphasize), fligLoud (Loud), fligKaraoke (Karaoke Screen), fligHeadline (Headline), fligSpeedy (Speedy), fligWordHighlight (Word Highlight), fligWordHighlightBox (Highlight Box), fligLinkUp (Link Up), fligSnap (Snap), fligJumpUp (Jump Up), fligOpen (Open), fligStamp (Stamp), fligLanding (Landing), fligStretch (Stretch), fligHipHop (Hip Hop), fligHanging (Hanging), fligSwingWord (Swing), fligPuzzlePieces (Puzzle Pieces), fligFallingLeaves (Falling Leaves), fligSlowFade (Slow Fade), fligGlideRight (Glide Right), fligBounceOut (Bounce Out), fligFlickerOut (Flicker Out), fligSlideOut (Slide Out), fligFallApart (Fall Apart), fligWaveOut (Wave Out), fligSlideAway (Slide Away), fligHighlighter (Highlighter), fligWiggle (Wiggle), fligTwitchy (Twitchy), fligWavy (Wave), fligFLIGGlitch (Glitchy), fligReveal (Reveal), fligTypewriterBox (Typewriter Box), fligChatBubble (Chat Bubble), fligGhostedFadeIn (Ghosted Fade In), fligSimpleCaption (Simple Caption), fligShortHardCut (Short Hard Cut), fligShortPop (Short Pop), fligShortPopPhrase (Short Pop Phrase), fligFadeBox (Fade), fligZoomBox (Zoom)

## Text style presets — `applyTextPreset(name, id)` (needs `selectById` + `selectTool('textPresets')` first)
Title-safe: Strictly business, Super serious, Book smart, Secret society, Bronze medal, GALA, Hot take (loud). Caption-category presets double as caption styles.

Default [caption], Fade In [caption], Typewriter Box [caption], Simple V0 [caption], Short Hard Cut 1 [caption], Highlighter [caption], Ghosted fadeIn [caption], Ghosted fadeIn 2 [caption], Ghosted fadeIn 3 [caption], Short Pop 1 [caption], Soft Lines [caption], Word Highlight Box 2 [caption], Word Highlight 2 [caption], Simple V1 [caption], Simple [caption], Fade In V1 [caption], Soft V1 [caption], Short Hard Cut [caption], Short Pop [caption], Word Highlight Box [caption], Word Highlight [caption], Fade In V2 [caption], Soft V2 [caption], Short Hard Cut 2 [caption], Short Pop 2 [caption], Word Highlight Box V2 [caption], Word Highlight 3 [caption], Fade In V3 [caption], Short Hard Cut 3 [caption], Short Pop 3 [caption], Word Highlight Box V3 [caption], Word Highlight V3 [caption], Simple V5 [caption], Simple V6 [caption], Simple 2 [caption], Short Pop 4 [caption], Vertical Fade In [caption], Fade In 2 [caption], Vertical Fade In 2 [caption], None [text], Retro future [text], SUNDAY MORNING [text], PRINT SHOP [text], Doodle art [text], Hot take [text], SLIME TIME [text], POOL PARTY [text], Bronze medal [text], FIRST DRAFT [text], Starry nights [text], Hot glue [text], Strictly business [text], Secret society [text], Book smart [text], EPIC FABLE [text], Vibe alert [text], Boiling point [text], Princess treatment [text], Glowing heart [text], Roller rink [text], Fuzzy logic [text], Valentine's day [text], Flower power [text], LATE NIGHT JAM [text], Jazz club [text], Bubble float [text], Super serious [text], SQUISHY CITY [text], HEAVY METAL [text], Screen flicker [text], Dance party [text], SPOOKY NIGHTS [text], GALA [text]

## Caption styles — `setCaptionStyle(style)` (73; one call restyles every caption)
Proven: Highlighter (box follows the active phrase, colour via `setCaptionHighlightColor`). Calm: Simple, Simple V1, Soft Lines, Fade In. Pop: Short Pop 1, Word Highlight, Word Highlight Box.

Default, Fade In, Typewriter Box, Simple V0, Short Hard Cut 1, Highlighter, Ghosted fadeIn, Ghosted fadeIn 2, Ghosted fadeIn 3, Short Pop 1, Soft Lines, Word Highlight Box 2, Word Highlight 2, Simple V1, Simple, Fade In V1, Soft V1, Short Hard Cut, Short Pop, Word Highlight Box, Word Highlight, Fade In V2, Soft V2, Short Hard Cut 2, Short Pop 2, Word Highlight Box V2, Word Highlight 3, Fade In V3, Short Hard Cut 3, Short Pop 3, Word Highlight Box V3, Word Highlight V3, Simple V5, Simple V6, Simple 2, Short Pop 4, Vertical Fade In, Fade In 2, Vertical Fade In 2, None, Retro future, SUNDAY MORNING, PRINT SHOP, Doodle art, Hot take, SLIME TIME, POOL PARTY, Bronze medal, FIRST DRAFT, Starry nights, Hot glue, Strictly business, Secret society, Book smart, EPIC FABLE, Vibe alert, Boiling point, Princess treatment, Glowing heart, Roller rink, Fuzzy logic, Valentine's day, Flower power, LATE NIGHT JAM, Jazz club, Bubble float, Super serious, SQUISHY CITY, HEAVY METAL, Screen flicker, Dance party, SPOOKY NIGHTS, GALA

## Speed curves — `setSpeedCurve(id, preset)`
MONTAGE (Montage), HERO (Hero), BULLET (Bullet), JUMP_CUT (Jump cut), FLASH_IN (Flash in), FLASH_OUT (Flash out), RAMP (Ramp), STROBE (Strobe)

## Fonts — `setTextFont(id, family)` (377 via listCatalog kind=font; `listFonts` shows the first 50 of a tab)
Tabs: All, Simple, Bold, Retro, Playful, Handwritten, System. Instagram faces: IGUIBetav9-Heavy (the 'Classic' sans, captions default), InstagramSansCondensed-Bold, InstagramPoster-Black, InstagramSerif. Brand fonts: `importAccountFont(path)` then set by PostScript name.

## Royalty-free music — `addSongToComposition(audioAssetId)` (FULL id string; a truncated id fails)
The track is auto-trimmed to the composition length. Instrumental-safe picks from the royalty-free tab:

- Unplayed Guitar — 66.12s — `2048792335726950`
- Hiking — 179.419s — `1179765612975342`
- Something So Good (Instrumental) — 213.437s — `1390217821560695`
- Fondue — 164.678s — `703578324059155`
- Happier — 194.68s — `1823691608002236`
- I Can’t Live Without U (feat. Gary Ales Brook) — 187.62s — `2145349975830884`
- Ghost Wave Rider (Reels Sound - Reveal) — 36.388s — `1291893081946451`
- Reggae Brazuca — 60.052s — `1083682094094054`
- My Dog (Instrumental) — 168.68s — `1175941300344251`
- Fariyaad (Instrumental) — 166.77s — `1533983778147856`
- Only One Way To Know — 140.19s — `525351996641347`
- Silly Plucks — 63.098s — `3640939852736179`
- Day In The Life — 62.44s — `1070863265654121`
- 101 (feat. Mont Lee) — 157.858s — `697797532166224`
- Icicle Waltz (feat. Maeve Gilchrist) — 190.61s — `25179393558374527`
- Morning Sunshine — 171.479s — `326529176960602`
- Merry Lane — 164.117s — `586526506840536`
- Back To The Good Times — 145.56s — `2793991050742744`
- Coming Up — 141.191s — `185358457873611`
- Christmas Piano — 122.721s — `557830636154312`
- Red Shehnai — 150.79s — `636560474885698`
- Slowin It Down — 150.65s — `724434495981901`
- A Cautionary Tale — 113.34s — `5910322659050214`
- Oath — 193.16s — `865433977795058`
- Sunny Days — 59.95s — `4724608451159342`
- I Am A Song (prod. by Jonny Houlihan) — 249.92s — `887448106423116`
- Find Your Lane — 159.183s — `6807095446013297`
- 3:00 AM — 63.576s — `2616545468862727`
- Sunday In The Park With Diamonds — 166.664s — `1223581701582454`
- Wander — 252.05s — `1163333524366248`

## Sound effects — `addSoundEffect(effect)` at the playhead (`seek` first); id or exact title

**whoosh:** Whoosh (powerful) `1754232165660838`, Whoosh (dramatic) `1174284027940512`, Whoosh (deep) `2157714998358875`, Whoosh (whip) `1396845425768540`, Whoosh (short) 4 `24752205027742799`, Whoosh (bass) `4016730665123881`, Whoosh (magic) `1469484374354288`, Whoosh (airy) 8 `2398146380920271`, Riser (whoosh) 3 `1280995300315064`, Whoosh (chop) `1502340267602115`

**pop:** Notification (pop-up) 7 `2963397013857193`, Notification (pop-up) 4 `2953445418379301`, Notification (pop-up) `1488519876118528`, Horn (cartoon) `1368267301484584`, Notification (pop-up) 3 `1193410422717170`, Mobile select 2 `25029481110056675`, Notification (pop-up) 2 `1167576745546452`, Coin collect (8-bit) 2 `2220520645023461`, Button click (cartoon) `1990695238266238`, Balloon pop `1609507317314361`

**click:** Mouse click (single) 5 `2355465508551094`, Mouse click (single) 1 `801813285845459`, Walkie-talkie beep `27119127757715808`, Menu click (wooden) 2 `1069156349451809`, Menu click (sharp) `1915940096035227`, Button click (gaming) 3 `1970873137266445`, Button click (gaming) 4 `1838980613798446`, Button click (menu) 3 `4692719284308863`, Clicking (sci-fi) `1450495887195718`, Mouse click (double) 7 `1634044218105101`

Categories for `searchSoundEffects(category)`: forYou, cinematic, seasonal, transitions, action, comedy, reactions, game, alerts, nature, background, mechanical, musical, asmr, urban.

## Text-to-speech voices — `applyTextToSpeech`
alex, billie, robot, demon, chipmunk, monster, martian, radio, whisper, megaphone, vampire, prospector, calm, toddler, stuffy, encouraging, poised, bold, glamorous, gracious, chill, friendly, cheerful, bubbly, pirate, proud, sage
