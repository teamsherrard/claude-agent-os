// render_card.swift — zero-dependency card renderer for Edits overlays.
// usage: swift render_card.swift out.png "TEXT" [fontSize] [hexText] [hexPill] [fontName] [W] [H] [yFrac]
// Renders a transparent full-frame PNG (default 1080x1920) with one centred text line (emoji ok)
// on a rounded pill, so addOverlay(path, x=0.5, y=0.5, scale=1) lands it exactly where designed.
import AppKit
let a = CommandLine.arguments
let out = a[1]; let text = a[2]
let size = CGFloat(Double(a.count > 3 ? a[3] : "72") ?? 72)
func color(_ h: String) -> NSColor { var s = h; if s.hasPrefix("#") { s.removeFirst() }; let v = UInt32(s, radix: 16) ?? 0xFFFFFF
  let r = CGFloat((v >> 16) & 0xFF)/255, g = CGFloat((v >> 8) & 0xFF)/255, b = CGFloat(v & 0xFF)/255; return NSColor(srgbRed: r, green: g, blue: b, alpha: 1) }
let textColor = color(a.count > 4 ? a[4] : "#FFFFFF"); let pillHex = a.count > 5 ? a[5] : "#111111"
let fontName = a.count > 6 ? a[6] : "HelveticaNeue-Bold"
let W = CGFloat(Double(a.count > 7 ? a[7] : "1080") ?? 1080), H = CGFloat(Double(a.count > 8 ? a[8] : "1920") ?? 1920)
let yFrac = CGFloat(Double(a.count > 9 ? a[9] : "0.5") ?? 0.5)   // 0 = top, 1 = bottom (centre of pill)
let font = NSFont(name: fontName, size: size) ?? NSFont.boldSystemFont(ofSize: size)
let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(W), pixelsHigh: Int(H), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
rep.size = NSSize(width: W, height: H)
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
NSColor.clear.set(); NSRect(x: 0, y: 0, width: W, height: H).fill()
let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: textColor]
let str = NSAttributedString(string: text, attributes: attrs)
let ts = str.size()
let padX: CGFloat = size * 0.6, padY: CGFloat = size * 0.35
let pillW = ts.width + padX * 2, pillH = ts.height + padY * 2
let cx = W / 2, cy = H * (1 - yFrac)
if pillHex.lowercased() != "none" {
  let pill = NSBezierPath(roundedRect: NSRect(x: cx - pillW/2, y: cy - pillH/2, width: pillW, height: pillH), xRadius: pillH/2, yRadius: pillH/2)
  color(pillHex).withAlphaComponent(0.92).setFill(); pill.fill()
}
str.draw(at: NSPoint(x: cx - ts.width/2, y: cy - ts.height/2))
NSGraphicsContext.restoreGraphicsState()
try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: out))
print("wrote \(out) text=\(Int(ts.width))x\(Int(ts.height)) pill=\(Int(pillW))x\(Int(pillH))")
