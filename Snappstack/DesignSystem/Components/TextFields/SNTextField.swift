//
//  SNTextField.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public enum TextFieldType {
    case outlined
    case filled
    case floatingOutlined
    case floatingFilled
    case phoneOutlined
    case phoneFilled
}

struct Constants {
    struct Height {
        static let large: CGFloat = 58
        static let medium: CGFloat = 56
        static let small: CGFloat = 54
    }
}

public struct SNTextField: View {
    public var placeholder: String
    public var title: String = ""
    public var errorMessage: String = ""
    @Binding public var text: String
    public var type: TextFieldType = .outlined
    public var isSecure: Bool = false
    public var isError: Bool = false
    public var fillColor: Color? = .clear
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
        type: TextFieldType = .outlined,
        isSecure: Bool = false,
        isError: Bool = false,
        fillColor: Color? = .clear,
        activeBorderColor: Color? = nil,
        inactiveBorderColor: Color? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil
    ) {
        self.placeholder = placeholder
        self.title = title
        self.errorMessage = errorMessage
        self._text = text
        self.type = type
        self.isSecure = isSecure
        self.isError = isError
        self.fillColor = fillColor
        self.activeBorderColor = activeBorderColor ?? ColorTokens.gray4
        self.inactiveBorderColor = inactiveBorderColor ?? ColorTokens.gray2
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
    }
    
    public var body: some View {
        switch type {
        case .outlined, .filled:
            baseView
        case .floatingOutlined, .floatingFilled:
            floatingView
        case .phoneOutlined, .phoneFilled:
            phoneView
        }
    }
    
    private var baseView: some View {
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
                    Rectangle().frame(width: SpacingTokens.line, height: SpacingTokens.sm).foregroundColor(type == .filled ? ColorTokens.gray4.opacity(isFocused ? OpacityTokens.opacity100 : OpacityTokens.opacity50) : ColorTokens.gray2)
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
            .background(type == .filled ? (fillColor?.opacity(isFocused ? OpacityTokens.opacity100 : OpacityTokens.opacity50)): nil)
            .overlay(
                type == .filled ? nil : RoundedRectangle(cornerRadius: SpacingTokens.xs).stroke(isError ? ColorTokens.error : (isFocused ? activeBorderColor : inactiveBorderColor), lineWidth: SpacingTokens.line)
            )
            .cornerRadius(SpacingTokens.xs)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(FontTokens.caption1.font)
                    .foregroundColor(ColorTokens.error)
            }
        }
    }
        
    private var phoneView: some View {
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
            .background(type == .phoneFilled ? (fillColor?.opacity(isFocused ? OpacityTokens.opacity100 : OpacityTokens.opacity50)): nil)
            .overlay(
                type == .phoneFilled ? nil : RoundedRectangle(cornerRadius: SpacingTokens.xs).stroke(isError ? ColorTokens.error : (isFocused ? activeBorderColor : inactiveBorderColor), lineWidth: SpacingTokens.line)
            )
            .cornerRadius(SpacingTokens.xs)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(FontTokens.caption1.font)
                    .foregroundColor(ColorTokens.error)
            }
        }
    }
        
    private var floatingView: some View {
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
            .background(type == .floatingFilled ? (fillColor?.opacity(isFocused ? OpacityTokens.opacity100 : OpacityTokens.opacity50)): nil)
            .overlay(
                type == .floatingFilled ? nil : RoundedRectangle(cornerRadius: SpacingTokens.xs).stroke(isError ? ColorTokens.error : (isFocused ? activeBorderColor : inactiveBorderColor), lineWidth: SpacingTokens.line)
            )
            .cornerRadius(SpacingTokens.xs)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(FontTokens.caption1.font)
                    .foregroundColor(ColorTokens.error)
            }
        }

    }
    
}

struct PhoneNumberField: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> PhoneNumberTextField {
        let textField = PhoneNumberTextField()
        
        textField.withPrefix = true
        textField.withFlag = true
        textField.withExamplePlaceholder = true
        textField.withDefaultPickerUI = true
        
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: PhoneNumberTextField, context: Context) {
        uiView.text = text
        
        guard let phoneNumber = uiView.phoneNumber else {
            return
        }
        
        if phoneNumber.countryCode == 33, phoneNumber.type == .mobile, String(phoneNumber.nationalNumber).count != 10 {
            return
        }
        
        DispatchQueue.main.async {
            uiView.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: PhoneNumberField
        
        init(_ parent: PhoneNumberField) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            if let text = textField.text {
                parent.text = text
            }
        }
    }
}

