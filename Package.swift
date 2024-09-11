// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-snapshot-testing-plugin-heic",
  
  // TODO: update this with more tested platforms
  platforms: [
    .iOS(.v14),
    .macOS(.v11),
    .tvOS(.v14),
    .watchOS(.v7),
  ],
  
  products: [
    .library(
      name: "HEICImageSerializer",
      targets: ["HEICImageSerializer"]
    ),
  ],
  
  dependencies: [
    .package(url: "https://github.com/mackoj/swift-snapshot-testing.git", revision: "b899f13"),
  ],
  
  targets: [
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
