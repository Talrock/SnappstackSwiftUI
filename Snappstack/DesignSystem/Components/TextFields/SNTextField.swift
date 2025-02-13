//
//  SNTextField.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public struct SNTextField: View {
    public var placeholder: String
    public var title: String = ""
    public var errorMessage: String = ""
    @Binding public var text: String
    public var isSecure: Bool = false
    public var isError: Bool = false
    public var activeBorderColor: Color = ColorTokens.gray4
    public var inactiveBorderColor: Color = ColorTokens.gray2
    public var leadingIcon: Image? = nil
    public var trailingIcon: Image? = nil
    @FocusState public var isFocused: Bool
    
    public init(
        placeholder: String,
        title: String = "",
        errorMessage: String = "",
        text: Binding<String>,
        isSecure: Bool = false,
        isError: Bool = false,
        activeBorderColor: Color? = nil,
        inactiveBorderColor: Color? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil
    ) {
        self.placeholder = placeholder
        self.title = title
        self.errorMessage = errorMessage
        self._text = text
        self.isSecure = isSecure
        self.isError = isError
        self.activeBorderColor = activeBorderColor ?? ColorTokens.gray4
        self.inactiveBorderColor = inactiveBorderColor ?? ColorTokens.gray2
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: SpacingTokens.xxxs) {
            if !title.isEmpty {
                Text(title)
                    .font(FontTokens.noteMedium.font)
                    .foregroundColor(isError ? ColorTokens.error : ColorTokens.textPrimary)
            }
            HStack {
                if let leadingIcon = leadingIcon {
                    leadingIcon
                        .foregroundColor(isError ? ColorTokens.error : ColorTokens.gray4)
                        .padding(.leading, SpacingTokens.xs)
                        .padding(.trailing, 0)
                    Rectangle().frame(width: SpacingTokens.line, height: SpacingTokens.sm).foregroundColor(ColorTokens.gray2)
                }
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .padding(.vertical, SpacingTokens.xs2)
                        .padding(.trailing, leadingIcon == nil ? SpacingTokens.xs2 : 0)
                        .padding(.leading, leadingIcon == nil ? SpacingTokens.xs2 : 0)
                        .focused($isFocused)
                        .foregroundColor(ColorTokens.textPrimary)
                } else {
                    TextField(placeholder, text: $text)
                        .padding(.vertical, SpacingTokens.xs2)
                        .padding(.trailing, leadingIcon == nil ? SpacingTokens.xs2 : 0)
                        .padding(.leading, leadingIcon == nil ? SpacingTokens.xs2 : 0)
                        .focused($isFocused)
                        .foregroundColor(ColorTokens.textPrimary)
                }
                if let trailingIcon = trailingIcon {
                    trailingIcon
                        .foregroundColor(isError ? ColorTokens.error : ColorTokens.gray4)
                        .padding(.trailing, SpacingTokens.xs)
                }
            }
            .cornerRadius(SpacingTokens.xs)
            .overlay(
                RoundedRectangle(cornerRadius: SpacingTokens.xs)
                    .stroke(isError ? ColorTokens.error : (isFocused ? activeBorderColor : inactiveBorderColor), lineWidth: SpacingTokens.line)
            )
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(FontTokens.caption1.font)
                    .foregroundColor(ColorTokens.error)
            }
        }
    }
}
