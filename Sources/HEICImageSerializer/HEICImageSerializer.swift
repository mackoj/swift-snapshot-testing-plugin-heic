import Foundation
import ImageIO
import UniformTypeIdentifiers
import ImageSerializationPlugin

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public class HEICImageSerializer: ImageSerializationPlugin {
  required public init() {}
  static public let imageFormat: ImageSerializationFormat = .plugins("heic")
  static public let identifier: String = "ImageSerializationPlugin.heic"
  
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
  
  public func decodeImage(_ data: Data) -> SnapImage? {
#if !os(macOS)
    return UIImage(data: data)
#else
    return NSImage(data: data)
#endif
  }
}
