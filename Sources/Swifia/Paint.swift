import CSkia

class Paint {
  var raw: OpaquePointer

  init() {
    raw = sk_paint_new()
  }

  deinit {
    sk_paint_delete(raw)
  }

  var antialias: Bool {
    get {
      return sk_paint_is_antialias(raw)
    }
    set(value) {
      sk_paint_set_antialias(raw, value)
    }
  }

  var color: UInt32 {
    get {
      return sk_paint_get_color(raw)
    }
    set(value) {
      sk_paint_set_color(raw, value)
    }
  }

  var stroke: Bool {
    get {
      return sk_paint_is_stroke(raw)
    }
    set(value) {
      sk_paint_set_stroke(raw, value)
    }
  }

  var strokeWidth: Float {
    get {
      return sk_paint_get_stroke_width(raw)
    }
    set(value) {
      sk_paint_set_stroke_width(raw, value)
    }
  }

  var strokeMiter: Float {
    get {
      return sk_paint_get_stroke_miter(raw)
    }
    set(value) {
      sk_paint_set_stroke_miter(raw, value)
    }
  }

  var strokeCap: sk_stroke_cap_t {
    get {
      return sk_paint_get_stroke_cap(raw)
    }
    set(value) {
      sk_paint_set_stroke_cap(raw, value)
    }
  }

  var strokeJoin: sk_stroke_join_t {
    get {
      return sk_paint_get_stroke_join(raw)
    }
    set(value) {
      sk_paint_set_stroke_join(raw, value)
    }
  }

  func setShader(value: Shader) {
    sk_paint_set_shader(raw, value.raw)
  }

  func setMaskFilter(value: MaskFilter) {
    sk_paint_set_maskfilter(raw, value.raw)
  }

  func setXferModeMode(value: sk_xfermode_mode_t) {
    sk_paint_set_xfermode_mode(raw, value)
  }
}
