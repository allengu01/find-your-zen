import Foundation
import UIKit

extension UIFont {
    public enum PoppinsType: String {
        case bold = "-Bold"
        case medium = "-Medium"
        case mediumItalic = "-MediumItalic"
        case regular = "-Regular"
        case semibold = "-SemiBold"
        case semiboldItalic = "-SemiBoldItalic"
    }

    static func Poppins(_ type: PoppinsType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Poppins\(type.rawValue)", size: size)!
    }
}
