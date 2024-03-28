//
//  CustomFonts.swift
//  Boutiques
//
//  Created by adobada on 3/23/24.
//

import SwiftUI

// MARK: - Custom font Baskerville

enum BaskervilleFont: String {
    case regular = "Baskerville"
    case italic = "Baskerville-Italic"
    case semiBold = "Baskerville-SemiBold"
    case semiBoldItalic = "Baskerville-SemiBoldItalic"
    case bold = "Baskerville-Bold"
    case boldItalic = "Baskerville-BoldItalic"
}

// MARK: - Custom font Univers.

enum UniversFont: String {
    case light = "UniversLTStd-Light"
}

// MARK: - Extensions

extension Font {
    static func custom(_ font: BaskervilleFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}

extension Font {
    static func custom(_ font: UniversFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}

// MARK: - Custom font family names

/*
Family: Baskerville Font names: [
"Baskerville",
"Baskerville-Italic",
"Baskerville-SemiBold",
"Baskerville-SemiBoldItalic",
"Baskerville-Bold",
"Baskerville-BoldItalic"
]

Family: Avenir Next Font names: [
"AvenirNext-Regular",
"AvenirNext-Italic",
"AvenirNext-UltraLight",
"AvenirNext-UltraLightItalic",
"AvenirNext-Medium",
"AvenirNext-MediumItalic",
"AvenirNext-DemiBold",
"AvenirNext-DemiBoldItalic",
"AvenirNext-Bold",
"AvenirNext-BoldItalic",
"AvenirNext-Heavy",
"AvenirNext-HeavyItalic"
]
*/

