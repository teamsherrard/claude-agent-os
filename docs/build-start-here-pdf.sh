#!/usr/bin/env bash
# Builds the YouTube System "Start Here" one-pager (docs → ~/Downloads copy for Claude Design / the portal).
# Usage: bash docs/build-start-here-pdf.sh [output-dir]   (default: current directory)
# Needs: python3 with reportlab + pypdf. Every drawn line is width-checked — the build fails on overflow.
set -e
SCRATCH="${1:-.}"
python3 - <<PY
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.colors import HexColor
W,H=letter
PURPLE=HexColor("#3D1E6D"); CHAR=HexColor("#1E1E24"); GOLD=HexColor("#C9A227"); INK=HexColor("#17171B"); BODY=HexColor("#3A3A42"); MUTE=HexColor("#6E6E78"); BOXBG=HexColor("#F5F2FA")
c=canvas.Canvas("$SCRATCH/YouTube System — Start Here.pdf",pagesize=letter)
OVER=[]
_ds=c.drawString
def _guard(x,y,t):
    w=c.stringWidth(t,c._fontname,c._fontsize)
    if x+w > W-40+0.5: OVER.append(f"by {x+w-(W-40):.0f}pt: {t[:80]!r}")
    _ds(x,y,t)
c.drawString=_guard
c.setFillColor(CHAR); c.rect(0,H-108,W,108,fill=1,stroke=0); c.setFillColor(PURPLE); c.rect(0,H-108,10,108,fill=1,stroke=0)
c.setFillColor(HexColor("#FFFFFF")); c.setFont("Helvetica-Bold",25); c.drawString(40,H-52,"The YouTube System — Start Here")
c.setFont("Helvetica",12.5); c.drawString(40,H-74,"Type these commands in Cowork, in this order. The system does the rest — you film.")
c.setFillColor(GOLD); c.setFont("Helvetica-Bold",9); c.drawString(40,H-95,"POWERED BY MIKE SHERRARD COACHING INC FRAMEWORKS")
y=H-132
c.setFillColor(GOLD); c.setFont("Helvetica-Bold",10.5); c.drawString(40,y,"BEFORE YOU START (ONE TIME)")
c.setFillColor(BODY); c.setFont("Helvetica",10.5); c.drawString(215,y,"1)  Your Brain is set up (Plugin 1)      2)  The YouTube System is installed")
y-=14; c.setStrokeColor(HexColor("#DDD7E8")); c.setLineWidth(1); c.line(40,y,W-40,y); y-=20
def chip(x,y,text):
    c.setFont("Helvetica-Bold",10.5); w=c.stringWidth(text,"Helvetica-Bold",10.5)+16
    c.setFillColor(PURPLE); c.roundRect(x,y-4.5,w,16.5,4,fill=1,stroke=0); c.setFillColor(HexColor("#FFFFFF")); c.drawString(x+8,y,text); return x+w
def step(n,y,cmd,what,action=False):
    c.setFillColor(GOLD); c.circle(52,y+4,9.5,fill=1,stroke=0); c.setFillColor(CHAR); c.setFont("Helvetica-Bold",11); c.drawCentredString(52,y,str(n))
    if action: c.setFillColor(INK); c.setFont("Helvetica-Bold",11); c.drawString(70,y,cmd)
    else: chip(70,y,cmd)
    c.setFillColor(BODY); c.setFont("Helvetica",9.8); c.drawString(70,y-13.5,what); return y-13.5-17
y-=6
y=step(1,y,'"Set up my YouTube system"',"It reads your Brain and asks ONE question — your channel link, or “starting fresh.”  About 5 minutes.")
y=step(2,y,"Your Game Plan builds by itself — just watch.","Channel audit, 3 pillars, ~50 ready titles, your goal turned into math, a 90-day calendar. Saved to your Drive.",True)
y=step(3,y,'"Build my content board"',"Say yes when it offers. Your next 2 weeks land in your Notion as cards with filming dates — each card fills itself.")
y=step(4,y,'"Set up my channel page"',"It writes every piece — description, links, keywords, playlists, banner text. Paste each into YouTube Studio. 15 min.")
y=step(5,y,'"What should I film?"',"Ranked ideas from YOUR plan. Pick one.")
y=step(6,y,'"Make this video"',"IN A NEW CHAT (one chat = one video — always). You get: the 3 top videos on your topic to beat, your script,")
c.setFillColor(BODY); c.setFont("Helvetica",9.8); c.drawString(70,y+8.5,"the SEO package, your lead magnet — and your board card filled with all of it."); y-=8
y=step(7,y,"Film it.","Phone + a \$20 lav mic. Read the script, one take, move on. Done is better than perfect.",True)
y=step(8,y,'"Repurpose this"',"That one video becomes shorts scripts, a blog post, an email, and social posts.")
y=step(9,y,'"Check my comments"',"Drop comment screenshots. It flags the LEADS first, drafts every reply in your voice, and finds your next ideas.")
y-=4; c.setFillColor(BOXBG); c.roundRect(40,y-58,W-80,62,6,fill=1,stroke=0)
c.setFillColor(PURPLE); c.setFont("Helvetica-Bold",11); c.drawString(54,y-14,"YOUR WEEK, FOREVER")
c.setFillColor(INK); c.setFont("Helvetica-Bold",10.5); c.drawString(54,y-32,'"What should I film?"   →   "Make this video" (new chat)   →   film it   →   "Repurpose this"')
c.setFillColor(BODY); c.setFont("Helvetica",10); c.drawString(54,y-48,"2 videos a week is the goal.  1 is the minimum.  Zero is the only way to lose."); y-=74
c.setFillColor(GOLD); c.setFont("Helvetica-Bold",10.5); c.drawString(40,y,"EVERY MONTH + WHEN YOU NEED THEM"); y-=17
SUB="First time only: add the Composio connector in Claude (2 min, playbook page 8), then say yes to the sign-in link."
assert c.stringWidth(SUB,"Helvetica-Oblique",8.8) < W-70-40, "sub-note too wide"
for cmd,note,sub in [('"Run my deep dive"',"once a month — your channel, competitors, gaps, and next 30 days in one report",SUB),('"Plan my filming day"',"film 4 videos in one afternoon",None),('"Market report"',"your monthly market video, ready to record",None),('"Coach me"',"what worked, the one fix, your next move",None)]:
    xe=chip(56,y,cmd); c.setFillColor(BODY); c.setFont("Helvetica",9.8); c.drawString(xe+8,y,"—  "+note); y-=13
    if sub: c.setFillColor(MUTE); c.setFont("Helvetica-Oblique",8.8); c.drawString(70,y,sub); y-=8
    y-=8
assert y > 56, f"rows ran into the footer (y={y})"
c.setStrokeColor(HexColor("#DDD7E8")); c.line(40,46,W-40,46)
c.setFillColor(MUTE); c.setFont("Helvetica",9); c.drawString(40,32,"Stuck anywhere? Just type “help.”")
c.setFont("Helvetica-BoldOblique",9.5); c.setFillColor(PURPLE); c.drawRightString(W-40,32,"“Done is better than perfect.” — Mike")
c.save()
print("overflows:", OVER); assert not OVER
from pypdf import PdfReader; print("PDF pages:", len(PdfReader("$SCRATCH/YouTube System — Start Here.pdf").pages))
PY
