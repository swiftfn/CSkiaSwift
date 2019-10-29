// https://github.com/google/skia/tree/master/experimental/c-api-example
// https://github.com/elegantchaos/CSkia

import Swifia
import Foundation

func makeSurface(_ w: Int32, _ h: Int32) -> Surface {
    let info = ImageInfo(w, h, RGBA_8888_SK_COLORTYPE, PREMUL_SK_ALPHATYPE)
    return Surface.newRaster(info)
}

func emitPng(_ path: String, _ surface: Surface) {
    let image = surface.newImageSnapshot()
    let encoded = image.encode()
    let raw = encoded.getData()
    let size = encoded.getSize()
    let data = Data(bytes: raw!, count: size)
    try? data.write(to: URL(fileURLWithPath: path))
}

func draw(_ canvas: Canvas) {
    let fill = Paint()
    fill.color = Color.argb(0xFF, 0x00, 0x00, 0xFF)
    canvas.drawPaint(fill)

    fill.color = argb(0xFF, 0x00, 0xFF, 0xFF)
    var rect = Rect(left: 100.0, top: 100.0, right: 540.0, bottom: 380.0)
    canvas.drawRect(rect, fill)

    let stroke = Paint()
    stroke.color = argb(0xFF, 0xFF, 0x00, 0x00)
    stroke.antialias = true
    stroke.stroke = true
    stroke.strokeWidth = 5.0

    let path = Path()
    path
        .moveTo(50.0, 50.0)
        .lineTo(590.0, 50.0)
        .cubicTo(-490.0, 50.0, 1130.0, 430.0, 50.0, 430.0)
        .lineTo(590.0, 430.0)
        .drawPath(path, stroke)

    fill.color = Color.argb(0x80, 0x00, 0xFF, 0x00)
    var rect2 = Rect(left: 120.0, top: 120.0, right: 520.0, bottom: 360.0)
    canvas.drawOval(rect2, fill)
}

let surface = make_surface(640, 480)
let canvas = surface.getCanvas()
draw(canvas)

let fileName = "skia-swift-example.png"
emit_png(fileName, surface)
print("Created \(fileName)")
