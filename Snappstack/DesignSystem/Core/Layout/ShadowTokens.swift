//
//  ShadowTokens.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

struct ShadowStyle {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}

struct ShadowTokens {
    static let sm = ShadowStyle(
        color: ColorTokens.black.opacity(0.1),
        radius: 4,
        x: 0,
        y: 2
    )
    
    static let md = ShadowStyle(
        color: ColorTokens.black.opacity(0.1),
        radius: 8,
        x: 0,
        y: 4
    )
    
    static let lg = ShadowStyle(
        color: ColorTokens.black.opacity(0.1),
        radius: 16,
        x: 0,
        y: 8
    )
    
    static let xl = ShadowStyle(
        color: ColorTokens.black.opacity(0.1),
        radius: 24,
        x: 0,
        y: 12
    )
}
