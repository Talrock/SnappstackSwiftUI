//
//  TextFieldView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 7/2/25.
//

import SwiftUI
import Snappstack

struct TextFieldView: View {
    @State private var title: String = ""
    @State private var phoneNumber: String = ""    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: SpacingTokens.xxxl) {
                VStack(alignment: .leading, spacing: SpacingTokens.md) {
                    HStack {
                        Text("Simple textfield")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNFilledTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        fillColor: ColorTokens.gray2,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        leadingIcon: Image("ic_card"),
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNFilledTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        fillColor: ColorTokens.gray2,
                        leadingIcon: Image("ic_card"),
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        isError: true,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        isError: true,
                        leadingIcon: Image("ic_card"),
                        trailingIcon: Image("ic_info")
                    )
                    
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Floating label textfield")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNFloatingTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNFilledFloatingTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        fillColor: ColorTokens.gray2,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNFloatingTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        isError: true,
                        trailingIcon: Image("ic_info")
                    )
                    
                }
                
                VStack(alignment: .leading, spacing: SpacingTokens.md) {
                    HStack {
                        Text("Phone number textfield")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNPhoneTextField(
                        placeholder: "Phone number",
                        title: "Label text",
                        text: $phoneNumber,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNFilledPhoneTextField(
                        placeholder: "Phone number",
                        title: "Label text",
                        text: $phoneNumber,
                        fillColor: ColorTokens.gray2,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNPhoneTextField(
                        placeholder: "Phone number",
                        title: "Label text",
                        text: $phoneNumber,
                        isError: true,
                        trailingIcon: Image("ic_info")
                    )
                    
                }
                
                //                VStack(alignment: .leading, spacing: SpacingTokens.md) {
                //                    HStack {
                //                        Text("OTP Textfield")
                //                            .font(.system(size: SpacingTokens.screenEdge, weight: .semibold))
                //                        Spacer()
                //                    }
                //                    SNTextField(
                //                        placeholder: "Input text",
                //                        title: "Label text",
                //                        text: $title,
                //                        trailingIcon: Image("ic_info")
                //                    )
                //
                //                }
            }
            .padding()
            
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
