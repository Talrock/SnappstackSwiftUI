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
                            .font(FontTokens.subheadline.font)
                        Spacer()
                    }
                    
                    SNTextField(
                        placeholder: "Input text",
                        text: $title,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        type: .filled,
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
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        type: .filled,
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
                        errorMessage: "Invalid card number",
                        text: $title,
                        type: .filled,
                        isError: true,
                        fillColor: ColorTokens.gray2,
                        leadingIcon: Image("ic_card"),
                        trailingIcon: Image("ic_info")
                    )
                    
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Floating label textfield")
                            .font(FontTokens.subheadline.font)
                        Spacer()
                    }
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        type: .floatingOutlined,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        text: $title,
                        type: .floatingFilled,
                        fillColor: ColorTokens.gray2,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Input text",
                        title: "Label text",
                        errorMessage: "Invalid text",
                        text: $title,
                        type: .floatingOutlined,
                        isError: true,
                        trailingIcon: Image("ic_info")
                    )
                    
                }
                
                VStack(alignment: .leading, spacing: SpacingTokens.md) {
                    HStack {
                        Text("Phone number textfield")
                            .font(FontTokens.subheadline.font)
                        Spacer()
                    }
                    
                    SNTextField(
                        placeholder: "Phone number",
                        text: $phoneNumber,
                        type: .phoneOutlined,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Phone number",
                        title: "Label text",
                        text: $phoneNumber,
                        type: .phoneFilled,
                        fillColor: ColorTokens.gray2,
                        trailingIcon: Image("ic_info")
                    )
                    
                    SNTextField(
                        placeholder: "Phone number",
                        title: "Label text",
                        errorMessage: "Invalid phone number",
                        text: $phoneNumber,
                        type: .phoneOutlined,
                        isError: true,
                        trailingIcon: Image("ic_info")
                    )
                    
                }
                
                //                VStack(alignment: .leading, spacing: SpacingTokens.md) {
                //                    HStack {
                //                        Text("OTP Textfield")
                //                            .font(FontTokens.subheadline.font)
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
