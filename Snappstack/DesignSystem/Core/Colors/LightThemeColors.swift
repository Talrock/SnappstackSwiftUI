//
//  LightThemeColors.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public final class LightThemeColors: ThemeProtocol {
    public let textPrimary: Color
    public let textSecondary: Color
    public let textTertiary: Color
    
    public let fillPrimary: Color
    public let fillSecondary: Color
    public let fill0: Color
    
    public let black: Color
    public let white: Color
    
    public let accent: Color
    public let success: Color
    public let error: Color
    public let warning: Color
    
    public let gray1: Color
    public let gray2: Color
    public let gray3: Color
    public let gray4: Color
    public let gray5: Color
    
    public init() {
        textPrimary = Color(.displayP3, red: 0.067, green: 0.067, blue: 0.067, opacity: 1)
        textSecondary = Color(.displayP3, red: 0.467, green: 0.467, blue: 0.467, opacity: 1)
        textTertiary = Color(.displayP3, red: 0.667, green: 0.667, blue: 0.667, opacity: 1)
        
        fillPrimary = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1)
        fillSecondary = Color(.displayP3, red: 0.98, green: 0.98, blue: 0.98, opacity: 1)
        fill0 = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 0)
        
        black = Color.black
        white = Color.white
        
        accent = Color(.displayP3, red: 0.106, green: 0.302, blue: 1.0, opacity: 1.0)
        success = Color(.displayP3, red: 0.2, green: 0.78, blue: 0.35, opacity: 1.0)
        error = Color(.displayP3, red: 0.95, green: 0.27, blue: 0.27, opacity: 1.0)
        warning = Color(.displayP3, red: 0.95, green: 0.77, blue: 0.2, opacity: 1.0)
        
        gray1 = Color(.displayP3, red: 0.96, green: 0.96, blue: 0.96, opacity: 1.0)
        gray2 = Color(.displayP3, red: 0.90, green: 0.90, blue: 0.90, opacity: 1.0)
        gray3 = Color(.displayP3, red: 0.75, green: 0.75, blue: 0.75, opacity: 1.0)
        gray4 = Color(.displayP3, red: 0.55, green: 0.55, blue: 0.55, opacity: 1.0)
        gray5 = Color(.displayP3, red: 0.35, green: 0.35, blue: 0.35, opacity: 1.0)
    }
}
