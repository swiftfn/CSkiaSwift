import CSkia

class Matrix {
  var raw: sk_matrix_t

  init() {
    raw = sk_matrix_t()
    sk_matrix_set_identity(&raw)
  }

  func setIdentity() {
    sk_matrix_set_identity(&raw)
  }

  func setTranslate(tx: Float, ty: Float) {
    sk_matrix_set_translate(&raw, tx, ty)
  }

  func preTranslate(tx: Float, ty: Float) {
    sk_matrix_pre_translate(&raw, tx, ty)
  }

  func postTranslate(tx: Float, ty: Float) {
    sk_matrix_post_translate(&raw, tx, ty)
  }

  func setScale(sx: Float, sy: Float) {
    sk_matrix_set_scale(&raw, sx, sy)
  }

  func preScale(sx: Float, sy: Float) {
    sk_matrix_pre_scale(&raw, sx, sy)
  }

  func postScale(sx: Float, sy: Float) {
    sk_matrix_post_scale(&raw, sx, sy)
  }
}
