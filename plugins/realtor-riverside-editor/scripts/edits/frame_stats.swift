// frame_stats.swift — measure a rendered frame so the grade can be decided from numbers, not guesses.
// usage: frame_stats <image.jpg|png> [faceBox x0,y0,x1,y1 normalised]
// prints JSON: mean luminance (0-1), contrast (luma std dev), shadow/highlight clipping %, colour cast (R-B, G-mid),
// saturation estimate, and the same for the face box when given. Zero dependencies (AppKit).
import AppKit
import Foundation
let a = CommandLine.arguments
guard a.count > 1, let img = NSImage(contentsOfFile: a[1]), let tiff = img.tiffRepresentation, let rep = NSBitmapImageRep(data: tiff) else { print("{\"error\":\"cannot read image\"}"); exit(1) }
let W = rep.pixelsWide, H = rep.pixelsHigh
func stats(_ x0: Int, _ y0: Int, _ x1: Int, _ y1: Int) -> [String: Double] {
  var n = 0.0, sumL = 0.0, sumL2 = 0.0, sumR = 0.0, sumG = 0.0, sumB = 0.0, dark = 0.0, bright = 0.0, sat = 0.0
  let step = max(1, (x1 - x0) / 300)
  var y = y0
  while y < y1 { var x = x0
    while x < x1 {
      if let c = rep.colorAt(x: x, y: y) {
        let r = Double(c.redComponent), g = Double(c.greenComponent), b = Double(c.blueComponent)
        let l = 0.2126 * r + 0.7152 * g + 0.0722 * b
        sumL += l; sumL2 += l * l; sumR += r; sumG += g; sumB += b; n += 1
        if l < 0.03 { dark += 1 }; if l > 0.97 { bright += 1 }
        let mx = max(r, g, b), mn = min(r, g, b); sat += mx > 0 ? (mx - mn) / mx : 0
      }
      x += step }
    y += step }
  guard n > 0 else { return [:] }
  let mean = sumL / n, sd = (sumL2 / n - mean * mean).squareRoot()
  return ["meanLuma": mean, "contrastSd": sd, "shadowClipPct": 100 * dark / n, "highlightClipPct": 100 * bright / n,
          "castRB": sumR / n - sumB / n, "castGmid": sumG / n - (sumR / n + sumB / n) / 2, "saturation": sat / n]
}
var out: [String: Any] = ["width": W, "height": H, "frame": stats(0, 0, W, H)]
if a.count > 2 { let p = a[2].split(separator: ",").compactMap { Double($0) }
  if p.count == 4 { out["face"] = stats(Int(p[0] * Double(W)), Int(p[1] * Double(H)), Int(p[2] * Double(W)), Int(p[3] * Double(H))) } }
let data = try! JSONSerialization.data(withJSONObject: out, options: [.sortedKeys]); print(String(data: data, encoding: .utf8)!)
