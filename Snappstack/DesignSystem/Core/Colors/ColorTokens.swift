//
//  ColorTokens.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

struct ColorTokens {
    static var textPrimary: Color { ThemeProvider.shared.currentTheme.textPrimary }
    static var textSecondary: Color { ThemeProvider.shared.currentTheme.textSecondary }
    static var textTertiary: Color { ThemeProvider.shared.currentTheme.textTertiary }
    
    static var fillPrimary: Color { ThemeProvider.shared.currentTheme.fillPrimary }
    static var fillSecondary: Color { ThemeProvider.shared.currentTheme.fillSecondary }
    static var fill0: Color { ThemeProvider.shared.currentTheme.fill0 }
    
    static var black: Color { ThemeProvider.shared.currentTheme.black }
    static var white: Color { ThemeProvider.shared.currentTheme.white }
    static var background: Color { ThemeProvider.shared.currentTheme.white }
    
    static var accent: Color { ThemeProvider.shared.currentTheme.accent }
    static var success: Color { ThemeProvider.shared.currentTheme.success }
    static var error: Color { ThemeProvider.shared.currentTheme.error }
    static var warning: Color { ThemeProvider.shared.currentTheme.warning }
    
    static var gray1: Color { ThemeProvider.shared.currentTheme.gray1 }
    static var gray2: Color { ThemeProvider.shared.currentTheme.gray2 }
    static var gray3: Color { ThemeProvider.shared.currentTheme.gray3 }
    static var gray4: Color { ThemeProvider.shared.currentTheme.gray4 }
    static var gray5: Color { ThemeProvider.shared.currentTheme.gray5 }
}
