//
//  BorderTokens.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

struct BorderStyle {
    let width: CGFloat
    let color: Color
}

struct BorderTokens {
    static let thin = BorderStyle(
        width: 1,
        color: ColorTokens.gray2
    )
    
    static let medium = BorderStyle(
        width: 2,
        color: ColorTokens.gray2
    )
    
    static let thick = BorderStyle(
        width: 4,
        color: ColorTokens.gray2
    )
}
