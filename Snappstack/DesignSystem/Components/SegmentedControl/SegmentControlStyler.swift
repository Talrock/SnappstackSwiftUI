//
//  SegmentControlStyler.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import Foundation
import SwiftUI

public struct Segment: Identifiable {
    
    public let title: String
    public var object: Any?
    
    public var id: String { self.title }
    
    public init(title: String, object: Any? = nil) {
        self.title = title
        self.object = object
    }
}

extension Segment: Equatable {
    
    public static func == (lhs: Segment, rhs: Segment) -> Bool {
        lhs.id == rhs.id
    }
}

public struct SegmentControlStyler {
    
    public struct ParentPadding {
        let top: CGFloat = SpacingTokens.xxs
        let horizontal: CGFloat = SpacingTokens.sm
        let bottom: CGFloat = SpacingTokens.xxs
    }
    
    let style: SegmentControlStyler.Style
    
    let font: SegmentControlStylerFont
    let textColor: SegmentControlStylerColor
    
    var activeBarColor: Color
    var inactiveBarColor: Color
    var backgroundColor: Color
    var activeBarWidth: CGFloat = SpacingTokens.micro
    
    let parentPadding = ParentPadding()
    
    let titleTextPaddingSpaces: Int?
    
    public init(style: SegmentControlStyler.Style = .underline(),
                font: SegmentControlStylerFont,
                textColor: SegmentControlStylerColor,
                activeBarColor: Color,
                inactiveBarColor: Color = .clear,
                backgroundColor: Color,
                activeBarWidth: CGFloat? = nil,
                titleTextPaddingSpaces: Int? = nil) {
        
        self.style = style
        self.font = font
        self.textColor = textColor
        self.activeBarColor = activeBarColor
        self.inactiveBarColor = inactiveBarColor
        self.backgroundColor = backgroundColor
        self.titleTextPaddingSpaces = titleTextPaddingSpaces
        
        if let activeBarWidth {
            self.activeBarWidth = activeBarWidth
        }
    }
    
    public init(style: SegmentControlStyler.Style = .underline(),
                font: Font,
                textColor: SegmentControlStylerColor,
                activeBarColor: Color,
                inactiveBarColor: Color = .clear,
                backgroundColor: Color,
                activeBarWidth: CGFloat? = nil) {
        
        self.init(
            style: style,
            font: SegmentControlStylerFont(active: font),
            textColor: textColor,
            activeBarColor: activeBarColor,
            inactiveBarColor: inactiveBarColor,
            backgroundColor: backgroundColor,
            activeBarWidth: activeBarWidth
        )
    }

    public var titleSpacerText: String {
         Array(repeating: " ", count: titleTextPaddingSpaces ?? 0).joined()
    }
}

extension SegmentControlStyler {
    
    public enum Style {
        case underline(topPadding: CGFloat = SpacingTokens.xxxs)
        case overline(bottomPadding: CGFloat = SpacingTokens.xxxs)
        case capsule
    }
}

public struct SegmentControlStylerFont {
    
    let active: Font
    let inactive: Font
    
    public init(active: Font, inactive: Font? = nil) {
        self.active = active
        self.inactive = inactive ?? active
    }
}

public struct SegmentControlStylerColor {
    
    let active: Color
    let inactive: Color
    
    public init(active: Color, inactive: Color? = nil) {
        self.active = active
        self.inactive = inactive ?? active
    }
}
