import CSkia

public class ImageInfo {
  var raw: OpaquePointer

  public init(_ width: Int32, _ height: Int32, _ ct: sk_colortype_t, _ at: sk_alphatype_t) {
    let raw = sk_imageinfo_new(width, height, ct, at, nil)
    self.raw = raw!
  }

  deinit {
    sk_imageinfo_delete(raw)
  }

  public var width: Int32 {
    get {
      return sk_imageinfo_get_width(raw)
    }
  }

  public var height: Int32 {
    get {
      return sk_imageinfo_get_height(raw)
    }
  }

  public var colorType: sk_colortype_t {
    get {
      return sk_imageinfo_get_colortype(raw)
    }
  }

  public var alphaType: sk_alphatype_t {
    get {
      return sk_imageinfo_get_alphatype(raw)
    }
  }
}
