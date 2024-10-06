> [!IMPORTANT]  
> - This is a prototype implementation to test the `ImagePluginAPI` of `swift-snapshot-testing`.

# swift-snapshot-testing-plugin-heic

This repo is an experimental use of this branch(https://github.com/pointfreeco/swift-snapshot-testing/pull/904) that contains a PluginAPI for `swift-snapshot-testing`.

The goal of this is to show how easy it is to build a plugin.

## Usage

To utilize the HEIC image serializer in your tests, follow these steps:

1. **Add the Dependency**: Include this project as a dependency in your `Package.swift` file:

```swift
    .package(url: "https://github.com/mackoj/swift-snapshot-testing-plugin-heic.git", revision: "0.0.1"),
```

2. **Link to Your Test Target**: Add the HEICImageSerializer to your test target's dependencies:

```swift
    .product(name: "HEICImageSerializer", package: "swift-snapshot-testing-plugin-heic"),
```

3. **Import and Set Up**: In your test file, import the serializer and set the image format in the `setUp()` method:

```swift
    import HEICImageSerializer

    override class func setUp() {
        SnapshotTesting.imageFormat = HEICImageSerializer.imageFormat
    }
```

> [!IMPORTANT]  
> On non Apple platform use this instead.

```swift
    import HEICImageSerializer

    override class func setUp() {
        SnapshotTesting.imageFormat = HEICImageSerializer.imageFormat
        PluginRegistry.registerPlugin(HEICImageSerializer.init())
    }
```

## TODO

- [ ] make the API ready for Swift 6 and async/throwing functions
- [ ] create a tests suite
- [x] add documentations
- [ ] add tutorials
