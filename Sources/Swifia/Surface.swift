import CSkia

class Surface {
  static func newRaster(imageInfo: ImageInfo) -> Surface {
    let raw = sk_surface_new_raster(imageInfo.raw, nil)
    return Surface(raw!)
  }

  static func newRasterDirect(imageInfo: ImageInfo, pixels: UnsafeMutableRawPointer, rowBytes: Int) -> Surface {
    let raw = sk_surface_new_raster_direct(imageInfo.raw, pixels, rowBytes, nil)
    return Surface(raw!)
  }

  var raw: OpaquePointer

  init(_ raw: OpaquePointer) {
    self.raw = raw
  }

  deinit {
    sk_surface_unref(raw)
  }

  var canvas: Canvas {
    get {
      let rawCanvas = sk_surface_get_canvas(raw)
      return Canvas(raw: rawCanvas!)
    }
  }

  func newImageSnapshot() -> Image {
    let rawImg = sk_surface_new_image_snapshot(raw)
    return Image(rawImg!)
  }
}
