import CSkia

class Image {
  static func newRasterCopy(imageInfo: ImageInfo, pixels: UnsafeRawPointer, rowBytes: Int) -> Image {
    let raw = sk_image_new_raster_copy(imageInfo.raw, pixels, rowBytes)
    return Image(raw!)
  }

  static func newFromEncoded(encoded: Data, subset: IRect) -> Image {
    var r = subset.toSk()
    let raw = sk_image_new_from_encoded(encoded.raw, &r)
    return Image(raw!)
  }

  var raw: OpaquePointer

  init(_ raw: OpaquePointer) {
    self.raw = raw
  }

  deinit {
    sk_image_unref(raw)
  }

  func ref() {
    sk_image_ref(raw)
  }

  func unref() {
    sk_image_unref(raw)
  }

  func encode() -> Data {
    let rawData = sk_image_encode(raw)
    return Data(rawData!)
  }

  var width: Int32 {
    get {
      return sk_image_get_width(raw)
    }
  }

  var height: Int32 {
    get {
      return sk_image_get_height(raw)
    }
  }

  var uniqueId: UInt32 {
    get {
      return sk_image_get_unique_id(raw)
    }
  }
}
