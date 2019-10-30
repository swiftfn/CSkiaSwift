import CSkia

class MaskFilter {
  static func blur(blurStyle: sk_blurstyle_t, sigma: Float) -> MaskFilter {
    let raw = sk_maskfilter_new_blur(blurStyle, sigma)
    return MaskFilter(raw!)
  }

  var raw: OpaquePointer

  init(_ raw: OpaquePointer) {
    self.raw = raw
  }

  deinit {
    sk_maskfilter_unref(raw)
  }

  func ref() {
    sk_maskfilter_ref(raw)
  }

  func unref() {
    sk_maskfilter_unref(raw)
  }
}
