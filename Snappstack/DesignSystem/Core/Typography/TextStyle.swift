//
//  TextStyle.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public struct TextStyle {
    public let font: Font
    let lineHeight: CGFloat
    let letterSpacing: CGFloat
    let textCase: Text.Case?
    
    init(
        font: Font,
        lineHeight: CGFloat,
        letterSpacing: CGFloat = 0,
        textCase: Text.Case? = nil
    ) {
        self.font = font
        self.lineHeight = lineHeight
        self.letterSpacing = letterSpacing
        self.textCase = textCase
    }
}
