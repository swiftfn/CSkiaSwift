import CSkia

class Data {
  static func empty() -> Data {
    let raw = sk_data_new_empty()
    return Data(raw!)
  }

  static func copy(src: UnsafeRawPointer, length: Int) -> Data {
    let raw = sk_data_new_with_copy(src, length)
    return Data(raw!)
  }

  static func malloc(memory: UnsafeRawPointer, length: Int) -> Data {
    let raw = sk_data_new_from_malloc(memory, length)
    return Data(raw!)
  }

  var raw: OpaquePointer

  init(_ raw: OpaquePointer) {
    self.raw = raw
  }

  deinit {
    sk_data_unref(raw)
  }

  func ref() {
    sk_data_ref(raw)
  }

  func unref() {
    sk_data_unref(raw)
  }

  func newSubset(src: Data, offset: Int, length: Int) -> Data {
    let raw = sk_data_new_subset(src.raw, offset, length)
    return Data(raw!)
  }

  var size: Int {
    get {
      return sk_data_get_size(raw)
    }
  }

  var rawData: UnsafeRawPointer {
    get {
      return sk_data_get_data(raw)
    }
  }
}