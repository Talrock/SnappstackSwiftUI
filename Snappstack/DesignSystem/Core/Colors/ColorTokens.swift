//
//  ColorTokens.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public struct ColorTokens {
    public static var textPrimary: Color { ThemeProvider.shared.currentTheme.textPrimary }
    public static var textSecondary: Color { ThemeProvider.shared.currentTheme.textSecondary }
    public static var textTertiary: Color { ThemeProvider.shared.currentTheme.textTertiary }
    
    public static var fillPrimary: Color { ThemeProvider.shared.currentTheme.fillPrimary }
    public static var fillSecondary: Color { ThemeProvider.shared.currentTheme.fillSecondary }
    public static var fill0: Color { ThemeProvider.shared.currentTheme.fill0 }
    
    public static var black: Color { ThemeProvider.shared.currentTheme.black }
    public static var white: Color { ThemeProvider.shared.currentTheme.white }
    public static var background: Color { ThemeProvider.shared.currentTheme.white }
    
    public static var accent: Color { ThemeProvider.shared.currentTheme.accent }
    public static var success: Color { ThemeProvider.shared.currentTheme.success }
    public static var error: Color { ThemeProvider.shared.currentTheme.error }
    public static var warning: Color { ThemeProvider.shared.currentTheme.warning }
    
    public static var gray0: Color { ThemeProvider.shared.currentTheme.gray0 }
    public static var gray1: Color { ThemeProvider.shared.currentTheme.gray1 }
    public static var gray2: Color { ThemeProvider.shared.currentTheme.gray2 }
    public static var gray3: Color { ThemeProvider.shared.currentTheme.gray3 }
    public static var gray4: Color { ThemeProvider.shared.currentTheme.gray4 }
    public static var gray5: Color { ThemeProvider.shared.currentTheme.gray5 }
}
