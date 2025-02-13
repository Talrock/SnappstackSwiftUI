//
//  SNPhoneTextField.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public struct SNPhoneTextField: View {
    public var placeholder: String
    public var title: String = ""
    public var errorMessage: String = ""
    @Binding public var text: String
    public var isError: Bool = false
    public var activeBorderColor: Color = ColorTokens.gray4
    public var inactiveBorderColor: Color = ColorTokens.gray2
    public var trailingIcon: Image? = nil
    @FocusState public var isFocused: Bool
    
    public init(
        placeholder: String,
        title: String = "",
        errorMessage: String = "",
        text: Binding<String>,
        isError: Bool = false,
        activeBorderColor: Color? = nil,
        inactiveBorderColor: Color? = nil,
        trailingIcon: Image? = nil
    ) {
        self.placeholder = placeholder
        self.title = title
        self.errorMessage = errorMessage
        self._text = text
        self.isError = isError
        self.activeBorderColor = activeBorderColor ?? ColorTokens.gray4
        self.inactiveBorderColor = inactiveBorderColor ?? ColorTokens.gray2
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
                PhoneNumberField(text: $text)
                    .padding(.vertical, SpacingTokens.xs2)
                    .padding(.horizontal, SpacingTokens.xs2)
                    .focused($isFocused)
                    .foregroundColor(ColorTokens.textPrimary)
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


