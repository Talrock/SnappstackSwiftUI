//
//  ThemeProvider.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

final class ThemeProvider: ObservableObject {
    static let shared = ThemeProvider()
    
    @Published private(set) var currentTheme: ThemeProtocol
    
    init(theme: ThemeProtocol = LightThemeColors()) {
        self.currentTheme = theme
    }
    
    func switchToLight() {
        currentTheme = LightThemeColors()
    }
    
    func switchToDark() {
        currentTheme = DarkThemeColors()
    }
}
