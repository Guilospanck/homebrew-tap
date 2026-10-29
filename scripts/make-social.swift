// Draws the 1280x640 GitHub social preview image.
// Usage: swift scripts/make-social.swift <out.png> <icon.png>...
import AppKit

let w = 1280, h = 640
let args = CommandLine.arguments
let icons = args.dropFirst(2).map { NSImage(contentsOfFile: $0)! }
let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: w, pixelsHigh: h, bitsPerSample: 8,
                           samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
                           colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)

let bg = NSGradient(starting: NSColor(red: 0.98, green: 0.94, blue: 0.88, alpha: 1),
                    ending: NSColor(red: 0.95, green: 0.87, blue: 0.78, alpha: 1))!
bg.draw(in: NSRect(x: 0, y: 0, width: w, height: h), angle: -90)

let ink = NSColor(red: 0.24, green: 0.13, blue: 0.10, alpha: 1)
func center(_ s: String, size: CGFloat, weight: NSFont.Weight, color: NSColor, y: CGFloat, mono: Bool = false) {
    let font = mono ? NSFont.monospacedSystemFont(ofSize: size, weight: weight) : NSFont.systemFont(ofSize: size, weight: weight)
    let a = NSAttributedString(string: s, attributes: [.font: font, .foregroundColor: color])
    a.draw(at: NSPoint(x: (CGFloat(w) - a.size().width) / 2, y: y))
}

let size: CGFloat = 220, gap: CGFloat = 60
let total = CGFloat(icons.count) * size + CGFloat(icons.count - 1) * gap
for (i, icon) in icons.enumerated() {
    icon.draw(in: NSRect(x: (CGFloat(w) - total) / 2 + CGFloat(i) * (size + gap), y: 330, width: size, height: size))
}
center("Homebrew tap", size: 84, weight: .bold, color: ink, y: 200)
center("brew tap guilospanck/tap", size: 40, weight: .medium, color: ink.withAlphaComponent(0.75), y: 120, mono: true)

NSGraphicsContext.restoreGraphicsState()
try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: args[1]))
