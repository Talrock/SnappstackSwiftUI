//
//  DarkThemeColors.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public final class DarkThemeColors: ThemeProtocol {
    public let textPrimary: Color
    public let textSecondary: Color
    public let textTertiary: Color
    
    public let fillPrimary: Color
    public let fillSecondary: Color
    public let fill0: Color
    
    public let black: Color
    public let white: Color
    public let background: Color
    
    public let accent: Color
    public let success: Color
    public let error: Color
    public let warning: Color
    
    public let gray0: Color
    public let gray1: Color
    public let gray2: Color
    public let gray3: Color
    public let gray4: Color
    public let gray5: Color
    
    public init() {
        textPrimary = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1)
        textSecondary = Color(.displayP3, red: 0.827, green: 0.827, blue: 0.827, opacity: 1)
        textTertiary = Color(.displayP3, red: 0.667, green: 0.667, blue: 0.667, opacity: 1)
        
        fillPrimary = Color(.displayP3, red: 0.11, green: 0.11, blue: 0.118, opacity: 1)
        fillSecondary = Color(.displayP3, red: 0.17, green: 0.17, blue: 0.18, opacity: 1)
        fill0 = Color(.displayP3, red: 0, green: 0, blue: 0, opacity: 0)
        
        black = Color.black
        white = Color.white
        background = Color(.displayP3, red: 0, green: 0, blue: 0, opacity: 1)
        
        accent = Color(.displayP3, red: 0.4, green: 0.557, blue: 1.0, opacity: 1.0)
        success = Color(.displayP3, red: 0.35, green: 0.85, blue: 0.45, opacity: 1.0)
        error = Color(.displayP3, red: 1.0, green: 0.37, blue: 0.37, opacity: 1.0)
        warning = Color(.displayP3, red: 1.0, green: 0.85, blue: 0.3, opacity: 1.0)
        
        gray0 = Color(.displayP3, red: 0.01, green: 0.01, blue: 0.01, opacity: 1.0)
        gray1 = Color(.displayP3, red: 0.15, green: 0.15, blue: 0.15, opacity: 1.0)
        gray2 = Color(.displayP3, red: 0.25, green: 0.25, blue: 0.25, opacity: 1.0)
        gray3 = Color(.displayP3, red: 0.35, green: 0.35, blue: 0.35, opacity: 1.0)
        gray4 = Color(.displayP3, red: 0.55, green: 0.55, blue: 0.55, opacity: 1.0)
        gray5 = Color(.displayP3, red: 0.75, green: 0.75, blue: 0.75, opacity: 1.0)
    }
    
}
