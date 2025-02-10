//
//  PhoneNumberField.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 11/2/25.
//

import SwiftUI

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
            // Obsolete Korean mobile phone number
            // e.g. 011-123-4567
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
