import CSkia

class Shader {
  static func linearGradient(
    point0: Point, point1: Point,
    colors: inout [UInt32],
    tileMode: sk_shader_tilemode_t
  ) -> Shader {
    var points = [point0.toSk(), point1.toSk()]
    let raw = sk_shader_new_linear_gradient(&points, &colors, nil, Int32(colors.count), tileMode, nil)
    return Shader(raw!)
  }

  static func radialGradient(
    center: Point, radius: Float,
    colors: inout [UInt32],
    tileMode: sk_shader_tilemode_t
  ) -> Shader {
    var ccenter = center.toSk()
    let raw = sk_shader_new_radial_gradient(&ccenter, radius, &colors, nil, Int32(colors.count), tileMode, nil)
    return Shader(raw!)
  }

  static func sweepGradient(
    center: Point, radius: Float,
    colors: inout [UInt32]
  ) -> Shader {
    var ccenter = center.toSk()
    let raw = sk_shader_new_sweep_gradient(&ccenter, &colors, nil, Int32(colors.count), nil)
    return Shader(raw!)
  }

  static func conicalGradient(
    start: Point, startRadius: Float,
    end: Point, endRadius: Float,
    colors: inout [UInt32],
    tileMode: sk_shader_tilemode_t
  ) -> Shader {
    var cstart = start.toSk()
    var cend = end.toSk()
    let raw = sk_shader_new_two_point_conical_gradient(
        &cstart, startRadius,
        &cend, endRadius,
        &colors, nil, Int32(colors.count),
        tileMode,
        nil
    )
    return Shader(raw!)
  }

  var raw: OpaquePointer

  init(_ raw: OpaquePointer) {
    self.raw = raw
  }

  deinit {
    sk_shader_unref(raw)
  }

  func ref() {
    sk_shader_ref(raw)
  }

  func unref() {
    sk_shader_unref(raw)
  }
}
