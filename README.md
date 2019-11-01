# CSkiaSwift - Swift classes wrapper for Skia's C API

[Skia's C API](https://github.com/google/skia/tree/master/experimental/c-api-example)
is very limited and not actively developed.

Please use [SkiaSwift](https://github.com/swiftfn/SkiaSwift)
which is based on [SkiaSharp](https://github.com/mono/SkiaSharp)'s
[C API](https://github.com/mono/skia).
It has much more features.

See:
* https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md
* https://github.com/apple/swift-package-manager/blob/master/Documentation/PackageDescription.md
* https://clang.llvm.org/docs/Modules.html

See also:
* http://ankit.im/swift/2016/05/21/creating-objc-cpp-packages-with-swift-package-manager/
* https://github.com/google/skia/tree/master/experimental/c-api-example
* https://github.com/elegantchaos/CSkia

## Build Skia

See:
* https://skia.org/user/download
* https://skia.org/user/build
* https://stackoverflow.com/questions/50228652/how-to-compile-skia-on-windows
* https://github.com/flutter/engine/blob/master/tools/gn

Build static libraries:

```sh
bin/gn gen out/mac --args="is_debug=false is_official_build=true \
skia_use_system_expat=false skia_use_system_libjpeg_turbo=false \
skia_use_system_libpng=false skia_use_system_libwebp=false \
skia_use_system_zlib=false skia_use_system_icu=false \
skia_use_system_harfbuzz=false"

ninja -C out/static
```

## Build CSkiaSwift for Mac

Create symlinks to the built Skia above (`include/c` and `out/mac` directories are used):

```sh
cd Sources/CSkia/include/include
ln -s /path/to/skia/include/c

cd Sources/CSkia
ln -s /path/to/skia/out
```

Build:

```sh
swift build
swift build -c release
```

Run:

```sh
swift run Demo
.build/debug/Demo
.build/release/Demo
```
