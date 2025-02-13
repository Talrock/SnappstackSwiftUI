//
//  SNFilledFloatingTextField.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

struct Constants {
    struct Height {
        static let large: CGFloat = 58
        static let medium: CGFloat = 56
        static let small: CGFloat = 54
    }
}

public struct SNFilledFloatingTextField: View {
    public var placeholder: String
    public var title: String
    public var errorMessage: String = ""
    @Binding public var text: String
    public var isSecure: Bool = false
    public var isError: Bool = false
    public var fillColor: Color? = .clear
    public var trailingIcon: Image? = nil
    @FocusState public var isFocused: Bool
    
    public init(
        placeholder: String,
        title: String,
        errorMessage: String = "",
        text: Binding<String>,
        isSecure: Bool = false,
        isError: Bool = false,
        fillColor: Color? = .clear,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil
    ) {
        self.placeholder = placeholder
        self.title = title
        self.errorMessage = errorMessage
        self._text = text
        self.isSecure = isSecure
        self.isError = isError
        self.fillColor = fillColor
        self.trailingIcon = trailingIcon
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor((isFocused || !text.isEmpty) ? ColorTokens.gray4 : ColorTokens.gray2)
                        .offset(y: (isFocused || !text.isEmpty) ? -SpacingTokens.sm : 0)
                        .scaleEffect((isFocused || !text.isEmpty) ? 0.75 : 1.0, anchor: .leading)
                        .animation(.easeOut(duration: 0.2), value: (isFocused || !text.isEmpty))
                        .padding(.horizontal, SpacingTokens.xs)
                    
                    if isSecure {
                        SecureField("", text: $text)
                            .focused($isFocused)
                            .padding(.top, SpacingTokens.md)
                            .padding(.horizontal, SpacingTokens.xs)
                            .frame(height: Constants.Height.medium)
                    } else {
                        TextField("", text: $text)
                            .focused($isFocused)
                            .padding(.top, SpacingTokens.md)
                            .padding(.horizontal, SpacingTokens.xs)
                            .frame(height: Constants.Height.medium)
                    }
                }
                if let trailingIcon = trailingIcon {
                    trailingIcon
                        .foregroundColor(isError ? ColorTokens.error : ColorTokens.gray4)
                        .padding(.trailing, SpacingTokens.xs)
                }
            }
            .background(fillColor?.opacity(isFocused ? OpacityTokens.opacity100 : OpacityTokens.opacity50))
            .cornerRadius(SpacingTokens.xs)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(FontTokens.caption1.font)
                    .foregroundColor(ColorTokens.error)
            }
        }

    }
}
