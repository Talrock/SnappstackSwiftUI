//
//  ThemeProtocol.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public protocol ThemeProtocol {
    var textPrimary: Color { get }
    var textSecondary: Color { get }
    var textTertiary: Color { get }
    
    var fillPrimary: Color { get }
    var fillSecondary: Color { get }
    var fill0: Color { get }
    
    var black: Color { get }
    var white: Color { get }
    var background: Color { get }
    
    var accent: Color { get }
    var success: Color { get }
    var error: Color { get }
    var warning: Color { get }
    
    var gray0: Color { get }
    var gray1: Color { get }
    var gray2: Color { get }
    var gray3: Color { get }
    var gray4: Color { get }
    var gray5: Color { get }
}
