import CSkia

// Canvas has no deinit, thus it can be a struct, no need to be a class
struct Canvas {
  let raw: OpaquePointer

  func save() {
    sk_canvas_save(raw)
  }

  func saveLayer(rect: Rect?, paint: Paint?) {
    if let r = rect {
      var cr = r.toSk()
      sk_canvas_save_layer(raw, &cr, paint?.raw)
    } else {
      sk_canvas_save_layer(raw, nil, paint?.raw)
    }
  }

  func restore() {
    sk_canvas_restore(raw)
  }

  func translate(dx: Float, dy: Float) {
    sk_canvas_translate(raw, dx, dy)
  }

  func scale(sx: Float, sy: Float) {
    sk_canvas_scale(raw, sx, sy)
  }

  func rotateDegrees(degrees: Float) {
    sk_canvas_rotate_degrees(raw, degrees)
  }

  func rotateRadians(radians: Float) {
    sk_canvas_rotate_radians(raw, radians)
  }

  func skew(sx: Float, sy: Float) {
    sk_canvas_skew(raw, sx, sy)
  }

  func concat(matrix: Matrix) {
    sk_canvas_concat(raw, matrix)
  }

  func clipRect(rect: Rect) {
    var r = rect.toSk()
    sk_canvas_clip_rect(raw, &r)
  }

  func clipPath(path: Path) {
    sk_canvas_clip_path(raw, path.raw)
  }

  func drawPaint(paint: Paint) {
    sk_canvas_draw_paint(raw, paint.raw)
  }

  func drawRect(rect: Rect, paint: Paint) {
    var r = rect.toSk()
    sk_canvas_draw_rect(raw, &r, paint.raw)
  }

  func drawCircle(cx: Float, cy: Float, rad: Float, paint: Paint) {
    sk_canvas_draw_circle(raw, cx, cy, rad, paint.raw)
  }

  func drawOval(rect: Rect, paint: Paint) {
    var r = rect.toSk()
    sk_canvas_draw_oval(raw, &r, paint.raw)
  }

  func drawPath(path: Path, paint: Paint) {
    sk_canvas_draw_path(raw, path.raw, paint.raw)
  }

  func drawImage(image: Image, x: Float, y: Float, paint: Paint) {
    sk_canvas_draw_image(raw, image.raw, x, y, paint.raw)
  }

  func drawImageRect(image: Image, src: Rect, dst: Rect, paint: Paint) {
    var s = src.toSk()
    var d = dst.toSk()
    sk_canvas_draw_image_rect(raw, image.raw, &s, &d, paint.raw)
  }

  func drawPicture(picture: Picture, matrix: Matrix, paint: Paint) {
    sk_canvas_draw_picture(raw, picture.raw, matrix.raw, paint.raw)
  }
}
