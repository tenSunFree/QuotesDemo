import Foundation
import SwiftUI
import CoreData
import UIKit

#if !APPCLIP
extension SavedQuote {
  var wrappedAuthor: String {
    return author ?? "Unknown Author"
  }
  var wrappedText: String {
    return text ?? "Unknown Quote Text"
  }
  var wrappedGenre: String {
    return genre ?? "Unknown Quote Genre"
  }
}
#endif

extension GetRect {
  struct RectPreferenceKey: PreferenceKey {
    static func reduce(value: inout CGRect?, nextValue: () -> CGRect?) {
      value = nextValue()
    }
    typealias Value = CGRect?
    static var defaultValue: CGRect?
  }
}

extension UIView {
  func asImage(rect: CGRect) -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: rect)
    return renderer.image { rendererContext in
      layer.render(in: rendererContext.cgContext)
    }
  }
}

extension CGRect {
  var uiImage: UIImage? {
    UIApplication.shared.windows
      .filter { $0.isKeyWindow }
      .first?.rootViewController?.view
      .asImage(rect: self)
  }
}

extension View {
  func getRect(_ rect: Binding<CGRect>) -> some View {
    self.modifier(GetRect(rect: rect))
  }
}

extension UIColor {
  static func colorWith(name: String) -> UIColor? {
    let selector = Selector("\(name)Color")
    if UIColor.self.responds(to: selector) {
      let color = UIColor.self.perform(selector).takeUnretainedValue()
      return (color as? UIColor)
    } else {
      return nil
    }
  }
}

extension Double {
  func toInt() -> Int {
    Int(self)
  }
}

extension UserDefaults {
  public func optionalBool(forKey defaultName: String) -> Bool? {
    let defaults = self
    if let value = defaults.value(forKey: defaultName) {
      return value as? Bool
    }
    return nil
  }
}

extension UserDefaults {
  public func optionalDouble(forKey defaultName: String) -> Double? {
    let defaults = self
    if let value = defaults.value(forKey: defaultName) {
      return value as? Double
    }
    return nil
  }
}
