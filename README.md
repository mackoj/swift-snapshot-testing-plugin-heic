# swift-snapshot-testing-plugin-heic

# swift-snapshot-testing-plugin-heic

This repo is an experimental use of this branch(https://github.com/pointfreeco/swift-snapshot-testing/pull/904) that contains a PluginAPI for `swift-snapshot-testing`.

The goal of this is to show how easy it is to build a plugin.

## Usage

- Add this project to dependencies inside your `Package.swift`  -> `.package(url: "https://github.com/mackoj/swift-snapshot-testing-plugin-heic.git", revision: "0.0.1"),`.
- Then add this to your test target `.product(name: "HEICImageSerializer", package: "swift-snapshot-testing-plugin-heic"),`.
- Then add this to the top of your test file `import HEICImageSerializer` and in the `setUp()` add this `SnapshotTesting.imageFormat = HEICImageSerializer.imageFormat`.

## TODO

- [ ] make the API ready for Swift 6 and async/throwing functions
- [ ] create a tests suite
- [ ] add documentations
- [ ] add tutorials
