//
//  SnappButton.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public enum ButtonType {
    case primary
    case secondary
    case ghost
}

public enum ButtonSize {
    case large
    case medium
    case small
}

// SnappButtonConstants.swift
extension SnappButton {
    struct Constants {
        struct Height {
            static let large: CGFloat = 52
            static let medium: CGFloat = 44
            static let small: CGFloat = 36
        }
        
        struct Padding {
            static let horizontal: CGFloat = SpacingTokens.sm
            static let iconSpacing: CGFloat = SpacingTokens.xxs
        }
        
        struct Icon {
            static let large: CGFloat = 20
            static let medium: CGFloat = 16
            static let small: CGFloat = 14
        }
    }
}

// SnappButton.swift
public struct SnappButton: View {
    var title: String
    var action: (()->())?
    var type: ButtonType
    var size: ButtonSize = .large
    var isEnabled: Bool = true
    var isLoading: Bool = false
    var leadingIcon: Image? = nil
    var trailingIcon: Image? = nil
    
    public init(
        title: String,
        type: ButtonType = .primary,
        size: ButtonSize = .large,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        isEnabled: Bool = true,
        isLoading: Bool = false,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.type = type
        self.size = size
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.action = action
    }
    
    public var body: some View {
        Button(action: performAction) {
            HStack(spacing: Constants.Padding.iconSpacing) {
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
                    
                    Text(title)
                        .font(textStyle.font)
//                        .lineHeight(textStyle.lineHeight)
//                        .letterSpacing(textStyle.letterSpacing)
                        .foregroundColor(foregroundColor)
                    
                    if let trailingIcon = trailingIcon {
                        trailingIcon
                            .font(.system(size: iconSize))
                            .foregroundColor(foregroundColor)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: buttonHeight)
            .background(backgroundColor)
            .cornerRadius(RadiusTokens.md)
            .opacity(isEnabled ? OpacityTokens.opacity100 : OpacityTokens.opacity40)
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
        switch type {
        case .primary:
            return ColorTokens.accent
        case .secondary:
            return ColorTokens.fillSecondary
        case .ghost:
            return ColorTokens.fill0
        }
    }
    
    private var foregroundColor: Color {
        switch type {
        case .primary:
            return ColorTokens.white
        case .secondary, .ghost:
            return ColorTokens.accent
        }
    }
    
    private var borderStyle: some View {
        RoundedRectangle(cornerRadius: RadiusTokens.md)
            .strokeBorder(
                type == .ghost ? ColorTokens.accent : Color.clear,
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

