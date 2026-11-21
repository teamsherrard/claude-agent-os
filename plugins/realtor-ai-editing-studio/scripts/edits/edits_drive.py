"""Tiny driver for the Edits automation server, reusing the insta-edits bridge client.
Usage:  edits_drive.py tools [out.json]        -> list tool names (and save full schemas)
        edits_drive.py schema <tool>           -> print one tool's input schema
        edits_drive.py call <tool> '<json>'    -> call a tool with JSON args
The token is read by insta_edits.config and never printed."""
import sys, os, json, base64, time
sys.path.insert(0, os.path.expanduser('~/Library/Python/3.9/lib/python/site-packages'))
from insta_edits import config, transport

OUT = os.path.dirname(os.path.abspath(__file__))

def session():
    tok = config.load_token()
    c = transport.EditsClient(config.server_url(), tok.value if tok else None, timeout=600)
    r = c.post({"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18",
          "capabilities":{},"clientInfo":{"name":"smoke","version":"0"}}})
    c.post({"jsonrpc":"2.0","method":"notifications/initialized"})
    return c

def rpc(c, method, params, rid=2):
    msgs = c.post({"jsonrpc":"2.0","id":rid,"method":method,"params":params})
    for m in msgs:
        if isinstance(m, dict) and m.get("id") == rid:
            if "error" in m: return {"ERROR": m["error"]}
            return m.get("result")
    return {"RAW": msgs}

def list_tools(c):
    res = rpc(c, "tools/list", {})
    return res.get("tools", []) if isinstance(res, dict) else []

def call(c, name, args):
    res = rpc(c, "tools/call", {"name": name, "arguments": args}, rid=3)
    if not isinstance(res, dict): return res
    out = {"isError": res.get("isError", False)}
    texts, images = [], []
    for b in res.get("content", []) or []:
        if b.get("type") == "text":
            t = b["text"]
            try: texts.append(json.loads(t))
            except Exception: texts.append(t)
        elif b.get("type") == "image":
            fn = os.path.join(OUT, f"frame_{int(time.time()*1000)}_{len(images)}.{ 'jpg' if 'jpeg' in b.get('mimeType','') else 'png'}")
            open(fn, "wb").write(base64.b64decode(b["data"])); images.append(fn)
    if "structuredContent" in res: out["structured"] = res["structuredContent"]
    if texts: out["text"] = texts if len(texts) > 1 else texts[0]
    if images: out["images"] = images
    return out

if __name__ == "__main__":
    cmd = sys.argv[1]
    c = session()
    if cmd == "tools":
        tools = list_tools(c)
        if len(sys.argv) > 2: json.dump(tools, open(sys.argv[2], "w"), indent=1)
        print(len(tools), "tools:", ", ".join(sorted(t["name"] for t in tools)))
    elif cmd == "schema":
        for t in list_tools(c):
            if t["name"] == sys.argv[2]:
                print(t.get("description","")); print(json.dumps(t.get("inputSchema",{}), indent=1))
    elif cmd == "schemas":
        want=set(sys.argv[2].split(","))
        for t in list_tools(c):
            if t["name"] in want:
                sc=t.get("inputSchema",{}); props=sc.get("properties",{}); req=set(sc.get("required",[]))
                args=", ".join((("*" if k in req else "")+k+":"+str(v.get("type","?"))+(" "+str(v.get("enum")) if v.get("enum") else "")) for k,v in props.items())
                print(f"{t['name']}({args})\n    {t.get('description','')[:300]}")
    elif cmd == "state":
        r=call(c,"appState",{}); t=r.get("text",{})
        print({k:v for k,v in t.items() if k!="availableActions"} if isinstance(t,dict) else t)
    elif cmd == "call":
        args = json.loads(sys.argv[3]) if len(sys.argv) > 3 else {}
        print(json.dumps(call(c, sys.argv[2], args), indent=1, default=str)[:200000])
