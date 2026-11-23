import CoreGraphics
import Foundation

/// The C64 palette (Pepto PAL).
let c64Palette: [UInt32] = [
    0x000000, 0xFFFFFF, 0x68372B, 0x70A4B2, 0x6F3D86, 0x588D43, 0x352879, 0xB8C76F,
    0x6F4F25, 0x433900, 0x9A6759, 0x444444, 0x6C6C6C, 0x9AD284, 0x6C5EB5, 0x959595,
]

/// Indexed-colour 320x200 frame buffer, the same resolution as the C64 screen.
final class Screen {
    static let width = 320
    static let height = 200
    var pixels = [UInt8](repeating: 0, count: width * height)
    private var rgba = [UInt32](repeating: 0, count: width * height)

    func clear(_ c: UInt8 = 0) {
        for i in pixels.indices { pixels[i] = c }
    }

    @inline(__always) func set(_ x: Int, _ y: Int, _ c: UInt8) {
        guard x >= 0, y >= 0, x < Screen.width, y < Screen.height else { return }
        pixels[y * Screen.width + x] = c
    }

    func fillRect(_ x: Int, _ y: Int, _ w: Int, _ h: Int, _ c: UInt8) {
        for yy in max(0, y)..<min(Screen.height, y + h) {
            for xx in max(0, x)..<min(Screen.width, x + w) { pixels[yy * Screen.width + xx] = c }
        }
    }

    func makeImage() -> CGImage? {
        for i in 0..<pixels.count {
            let c = c64Palette[Int(pixels[i] & 15)]
            // RGBA little-endian: 0xAABBGGRR
            rgba[i] = 0xFF00_0000 | ((c & 0xFF) << 16) | (c & 0xFF00) | ((c >> 16) & 0xFF)
        }
        return rgba.withUnsafeBytes { buf -> CGImage? in
            guard let provider = CGDataProvider(data: Data(buf) as CFData) else { return nil }
            return CGImage(width: Screen.width, height: Screen.height, bitsPerComponent: 8, bitsPerPixel: 32,
                           bytesPerRow: Screen.width * 4, space: CGColorSpaceCreateDeviceRGB(),
                           bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue),
                           provider: provider, decode: nil, shouldInterpolate: false, intent: .defaultIntent)
        }
    }
}
