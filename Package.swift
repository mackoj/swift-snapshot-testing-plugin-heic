// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-snapshot-testing-plugin-heic",
  platforms: [
    .iOS(.v14),
    .macOS(.v11),
    .tvOS(.v14),
    .watchOS(.v7),
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "HEICImageSerializer",
      targets: ["HEICImageSerializer"]
    ),
  ],
  dependencies: [
    //    .package(path: "/Users/jeffreymacko/Developer/swift-snapshot-testing"),
    .package(url: "https://github.com/mackoj/swift-snapshot-testing.git", revision: "54c11f6"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "HEICImageSerializer",
      dependencies: [
        .product(name: "ImageSerializationPlugin", package: "swift-snapshot-testing"),
      ]
    ),
    .testTarget(
      name: "HEICImageSerializerTests",
      dependencies: ["HEICImageSerializer"]
    ),
  ]
)
