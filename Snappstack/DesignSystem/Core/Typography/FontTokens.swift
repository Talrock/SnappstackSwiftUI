//
//  FontTokens.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public struct FontTokens {
    public static let largeTitle = TextStyle(
        font: .system(size: 34, weight: .bold),
        lineHeight: 41,
        letterSpacing: 0.37
    )
    
    public static let title1 = TextStyle(
        font: .system(size: 28, weight: .bold),
        lineHeight: 34,
        letterSpacing: 0.36
    )
    
    public static let title2 = TextStyle(
        font: .system(size: 22, weight: .bold),
        lineHeight: 28,
        letterSpacing: 0.35
    )
    
    public static let title3 = TextStyle(
        font: .system(size: 20, weight: .semibold),
        lineHeight: 25,
        letterSpacing: 0.38
    )
    
    public static let headline = TextStyle(
        font: .system(size: 17, weight: .semibold),
        lineHeight: 22,
        letterSpacing: -0.41
    )
    
    public static let body = TextStyle(
        font: .system(size: 17, weight: .regular),
        lineHeight: 22,
        letterSpacing: -0.41
    )
    
    public static let callout = TextStyle(
        font: .system(size: 16, weight: .regular),
        lineHeight: 21,
        letterSpacing: -0.32
    )
    
    public static let subheadline = TextStyle(
        font: .system(size: 16, weight: .semibold),
        lineHeight: 21,
        letterSpacing: -0.32
    )
    
    public static let noteMedium = TextStyle(
        font: .system(size: 15, weight: .medium),
        lineHeight: 18,
        letterSpacing: -0.08
    )
    
    public static let footnote = TextStyle(
        font: .system(size: 13, weight: .regular),
        lineHeight: 18,
        letterSpacing: -0.08
    )
    
    public static let caption1 = TextStyle(
        font: .system(size: 12, weight: .regular),
        lineHeight: 16,
        letterSpacing: 0
    )
    
    public static let caption2 = TextStyle(
        font: .system(size: 11, weight: .regular),
        lineHeight: 13,
        letterSpacing: 0.06
    )
    
    // Button specific styles
    public struct Button {
        static let large = TextStyle(
            font: .system(size: 16, weight: .semibold),
            lineHeight: 22,
            letterSpacing: -0.41
        )
        
        static let medium = TextStyle(
            font: .system(size: 14, weight: .semibold),
            lineHeight: 20,
            letterSpacing: -0.24
        )
        
        static let small = TextStyle(
            font: .system(size: 12, weight: .semibold),
            lineHeight: 18,
            letterSpacing: -0.08
        )
    }
}
