import CSkia

class Path {
  var raw: OpaquePointer

  init() {
    raw = sk_path_new()
  }

  deinit {
    sk_path_delete(raw)
  }

  func moveTo(x: Float, y: Float) -> Path {
    sk_path_move_to(raw, x, y)
    return self
  }

  func lineTo(x: Float, y: Float) -> Path {
    sk_path_line_to(raw, x, y)
    return self
  }

  func quadTo(x0: Float, y0: Float, x1: Float, y1: Float) -> Path {
    sk_path_quad_to(raw, x0, y0, x1, y1)
    return self
  }

  func conicTo(x0: Float, y0: Float, x1: Float, y1: Float, w: Float) -> Path {
    sk_path_conic_to(raw, x0, y0, x1, y1, w)
    return self
  }

  func cubicTo(x0: Float, y0: Float, x1: Float, y1: Float, x2: Float, y2: Float) -> Path {
    sk_path_cubic_to(raw, x0, y0, x1, y1, x2, y2)
    return self
  }

  func close() -> Path {
    sk_path_close(raw)
    return self
  }

  func addRect(rect: Rect, direction: sk_path_direction_t) -> Path {
    var r = rect.toSk()
    sk_path_add_rect(raw, &r, direction)
    return self
  }

  func addOval(rect: Rect, direction: sk_path_direction_t) -> Path {
    var r = rect.toSk()
    sk_path_add_oval(raw, &r, direction)
    return self
  }

  var bounds: Rect? {
    get {
      var rect = sk_rect_t()
      let empty = sk_path_get_bounds(raw, &rect)
      return empty ? nil : Rect.fromSk(rect)
    }
  }
}
