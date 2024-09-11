import Foundation
import ImageIO
import UniformTypeIdentifiers
import ImageSerializationPlugin

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// A serializer class for handling HEIC image format encoding and decoding.
///
/// The `HEICImageSerializer` class conforms to the `ImageSerializationPlugin` protocol and provides functionality
/// to encode and decode images in the HEIC (High Efficiency Image Coding) format. It integrates with the plugin-based
/// image serialization architecture and uses the Core Graphics (`CGImageDestination`) APIs to perform the conversions.
public class HEICImageSerializer: ImageSerializationPlugin {

  /// Initializes a new instance of the `HEICImageSerializer`.
  ///
  /// The initializer is required to conform to the `ImageSerializationPlugin` protocol.
  required public init() {}
  
  /// The image format handled by this serializer, which is `heic`.
  static public let imageFormat: ImageSerializationFormat = .plugins("heic")
  
  /// A unique identifier for this serializer plugin.
  static public let identifier: String = "ImageSerializationPlugin.heic"
  
  /// Encodes a `SnapImage` into HEIC format.
  ///
  /// This method converts the provided `SnapImage` into HEIC format using Core Graphics' `CGImageDestination`.
  ///
  /// - Parameter image: The image to be encoded.
  /// - Returns: A `Data` object containing the encoded HEIC image, or `nil` if the encoding fails.
  public func encodeImage(_ image: SnapImage) -> Data? {
#if !os(macOS)
    guard let cgImage = image.cgImage else { return nil }
#else
    guard let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else { return nil }
#endif
    
    let data = NSMutableData()
    guard let destination = CGImageDestinationCreateWithData(data, UTType.heic.identifier as CFString, 1, nil) else { return nil }
    CGImageDestinationAddImage(destination, cgImage, [kCGImageDestinationLossyCompressionQuality: 0.8] as CFDictionary)
    guard CGImageDestinationFinalize(destination) else { return nil }
    return data as Data
  }
  
  /// Decodes HEIC data into a `SnapImage`.
  ///
  /// This method converts the provided HEIC data into a `SnapImage`.
  ///
  /// - Parameter data: The HEIC data to be decoded.
  /// - Returns: A `SnapImage` created from the data, or `nil` if the decoding fails.
  public func decodeImage(_ data: Data) -> SnapImage? {
#if !os(macOS)
    return UIImage(data: data)
#else
    return NSImage(data: data)
#endif
  }
}
