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
        self.title  = title
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

        let top: CGFloat
        let horizontal: CGFloat
        let bottom: CGFloat

        public init(top: CGFloat = SpacingTokens.sm, horizontal: CGFloat = SpacingTokens.xl, bottom: CGFloat = SpacingTokens.xxs) {
            self.top        = top
            self.horizontal = horizontal
            self.bottom     = bottom
        }
    } 
    
    let style: SegmentControlStyler.Style
    
    let font: SegmentControlStylerFont
    let textColor: SegmentControlStylerColor
    
    var activeBarColor: Color
    var activeBarWidth: CGFloat = SpacingTokens.xxxs
    
    let parentPadding: ParentPadding
    
    let titleTextPaddingSpaces: Int?
    
    public init(style: SegmentControlStyler.Style = .underline(),
                parentPadding: ParentPadding = .init(),
                font: SegmentControlStylerFont,
                textColor: SegmentControlStylerColor,
                activeBarColor: Color,
                activeBarWidth: CGFloat? = nil,
                titleTextPaddingSpaces: Int? = nil) {
        
        self.style                  = style
        self.parentPadding          = parentPadding
        self.font                   = font
        self.textColor              = textColor
        self.activeBarColor         = activeBarColor
        self.titleTextPaddingSpaces = titleTextPaddingSpaces
        
        if let activeBarWidth {
            self.activeBarWidth = activeBarWidth
        }
    }
    
    public init(style: SegmentControlStyler.Style = .underline(),
                parentPadding: ParentPadding = .init(),
                font: Font,
                textColor: SegmentControlStylerColor,
                activeBarColor: Color,
                activeBarWidth: CGFloat? = nil) {
        
        self.init(
            style: style,
            parentPadding: parentPadding,
            font: SegmentControlStylerFont(active: font),
            textColor: textColor,
            activeBarColor: activeBarColor,
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
        self.active   = active
        self.inactive = inactive ?? active
    }
}

public struct SegmentControlStylerColor {
    
    let active: Color
    let inactive: Color
    
    public init(active: Color, inactive: Color? = nil) {
        self.active   = active
        self.inactive = inactive ?? active
    }
}
