//
//  ThemeProvider.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI
import Combine

public final class ThemeProvider: ObservableObject {
    public static let shared = ThemeProvider()
    
    @Published public private(set) var currentTheme: ThemeProtocol
    
    public init(theme: ThemeProtocol = LightThemeColors()) {
        self.currentTheme = theme
    }
    
    public func switchToLight() {
        currentTheme = LightThemeColors()
    }
    
    public func switchToDark() {
        currentTheme = DarkThemeColors()
    }
}
