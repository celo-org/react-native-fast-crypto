require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name = package["name"]
  s.version = package["version"]
  s.summary = package["description"]
  s.homepage = package["homepage"]
  s.license = package["license"]
  s.authors = package["author"]

  s.platform = :ios, "9.0"
  s.requires_arc = true
  s.source = {
    :git => "https://github.com/EdgeApp/react-native-fast-crypto.git",
    :tag => "v#{s.version}",
  }
  s.library = "c++"
  s.xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++11",
    "CLANG_CXX_LIBRARY" => "libc++",
  }
  s.source_files = "ios/**/*.{h,m}"
  s.vendored_libraries =
    "ios/Libraries/libboost_system.a",
    "ios/Libraries/libboost_thread.a",
    "ios/Libraries/libcrypto.a",
    "ios/Libraries/libmymonerocorecpp.a",
    "ios/Libraries/libnativecrypto.a",
    "ios/Libraries/libsecp256k1.a",
    "ios/Libraries/libssl.a",
    "ios/Libraries/libz.a"

  s.dependency "React"
end
