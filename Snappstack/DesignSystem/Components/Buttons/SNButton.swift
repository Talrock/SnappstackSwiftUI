//
//  SNButton.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public enum ButtonType {
    case primary
    case secondary
    case tertiary
    case ghost
    case plain
    case appleLogin
    case googleLogin
}

public enum ButtonSize {
    case large
    case medium
    case small
}

// SNButtonConstants.swift
extension SNButton {
    struct Constants {
        struct Height {
            static let large: CGFloat = 52
            static let medium: CGFloat = 48
            static let small: CGFloat = 40
        }
        
        struct Padding {
            static let horizontal: CGFloat = SpacingTokens.sm
            static let iconSpacing: CGFloat = SpacingTokens.xxs
        }
        
        struct Icon {
            static let large: CGFloat = 22
            static let medium: CGFloat = 18
            static let small: CGFloat = 16
        }
    }
}

// SNButton.swift
public struct SNButton: View {
    var title: String
    var type: ButtonType
    var alignment: Alignment
    var size: ButtonSize = .large
    var titleColor: Color?
    var bgColor: Color?
    var isEnabled: Bool = true
    var isLoading: Bool = false
    var isFloating: Bool = false
    var leadingIcon: Image? = nil
    var trailingIcon: Image? = nil
    var action: (()->())?
    
    public init(
        title: String,
        type: ButtonType = .primary,
        alignment: Alignment = .center,
        size: ButtonSize = .large,
        titleColor: Color? = nil,
        bgColor: Color? = nil,
        isEnabled: Bool = true,
        isLoading: Bool = false,
        isFloating: Bool = false,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.type = type
        self.alignment = alignment
        self.size = size
        self.titleColor = titleColor
        self.bgColor = bgColor
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.isFloating = isFloating
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.action = action
    }
    
    public var body: some View {
        Button(action: performAction) {
            HStack(spacing: Constants.Padding.iconSpacing) {
                if (leadingIcon == nil && trailingIcon == nil && type != .plain) {
                    Rectangle().frame(width: 15).foregroundColor(Color.clear)
                }
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                        .scaleEffect(size == .small ? 0.8 : 1.0)
                } else {
                    if let leadingIcon = leadingIcon {
                        leadingIcon
                            .font(.system(size: iconSize))
                            .foregroundColor(foregroundColor)
                    }
                    if !title.isEmpty {
                        Text(title)
                            .font(textStyle.font)
                            .underline(type == .ghost)
                            .foregroundColor(foregroundColor)
                    }
                    if let trailingIcon = trailingIcon {
                        trailingIcon
                            .font(.system(size: iconSize))
                            .foregroundColor(foregroundColor)
                    }
                }
                if (leadingIcon == nil && trailingIcon == nil && type != .plain) {
                    Rectangle().frame(width: 15).foregroundColor(Color.clear)
                }
            }
            .frame(maxWidth: isFloating ? (title.isEmpty ? buttonHeight : nil) : .infinity, alignment: alignment)
            .frame(height: (type == .ghost || type == .plain) ? Constants.Height.small : buttonHeight)
            .background(backgroundColor)
            .cornerRadius(isFloating ? buttonHeight/2 : RadiusTokens.md)
            .opacity(isEnabled ? OpacityTokens.opacity100 : OpacityTokens.opacity50)
            .overlay(
                borderStyle
            )
        }
        .disabled(!isEnabled || isLoading)
        .buttonStyle(ResponsiveButtonStyle())
    }
    
    private var buttonHeight: CGFloat {
        switch size {
        case .large: return Constants.Height.large
        case .medium: return Constants.Height.medium
        case .small: return Constants.Height.small
        }
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .large: return Constants.Icon.large
        case .medium: return Constants.Icon.medium
        case .small: return Constants.Icon.small
        }
    }
    
    private var textStyle: TextStyle {
        switch size {
        case .large: return FontTokens.Button.large
        case .medium: return FontTokens.Button.medium
        case .small: return FontTokens.Button.small
        }
    }
    
    private var backgroundColor: Color {
        if let color  = bgColor {
            return color
        } else {
            switch type {
            case .primary:
                return ColorTokens.accent
            case .secondary, .googleLogin:
                return ColorTokens.fillSecondary
            case .tertiary:
                return ColorTokens.fill0
            case .ghost, .plain:
                return Color.clear
            case .appleLogin:
                return ColorTokens.textPrimary
            }
        }
    }
    
    private var foregroundColor: Color {
        if let color  = titleColor {
            return color
        } else {
            switch type {
            case .primary:
                return ColorTokens.white
            case .secondary, .tertiary, .ghost, .googleLogin, .plain:
                return ColorTokens.textPrimary
            case .appleLogin:
                return ColorTokens.gray0
            }
        }
    }
    
    private var borderStyle: some View {
        RoundedRectangle(cornerRadius: RadiusTokens.md)
            .strokeBorder(
                type == .tertiary ? ColorTokens.gray4 : Color.clear,
                lineWidth: BorderTokens.thin.width
            )
    }
    
    private func performAction() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        (action ?? {})()
    }
}

// ResponsiveButtonStyle.swift
struct ResponsiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

