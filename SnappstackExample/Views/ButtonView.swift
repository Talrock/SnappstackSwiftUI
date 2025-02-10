//
//  ButtonView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 4/2/25.
//

import SwiftUI
import Snappstack

struct ButtonView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: SpacingTokens.xxl) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Active Button")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNButton(
                        title: "Primary L",
                        type: .primary,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Primary M",
                        type: .primary,
                        size: .medium,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Primary S",
                        type: .primary,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Button Properties")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNButton(
                        title: "Message",
                        type: .primary,
                        leadingIcon: Image("ic_chat"),
                        action: {}
                    )
                    
                    SNButton(
                        title: "",
                        type: .primary,
                        isLoading: true,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Next",
                        type: .primary,
                        trailingIcon: Image("ic_right"),
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Disabled Button")
                            .font(.system(size: SpacingTokens.sm, weight: .bold))
                        Spacer()
                    }
                    
                    SNButton(
                        title: "Primary L",
                        type: .primary,
                        isEnabled: false,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Primary M",
                        type: .primary,
                        size: .medium,
                        isEnabled: false,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Primary S",
                        type: .primary,
                        size: .small,
                        isEnabled: false,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Secondary Button")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNButton(
                        title: "Secondary L",
                        type: .secondary,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Secondary M",
                        type: .secondary,
                        size: .medium,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Secondary S",
                        type: .secondary,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Tertiary Button")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNButton(
                        title: "Tertiary L",
                        type: .tertiary,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Tertiary M",
                        type: .tertiary,
                        size: .medium,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Tertiary S",
                        type: .tertiary,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Ghost Button")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNButton(
                        title: "Ghost L",
                        type: .ghost,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Ghost M",
                        type: .ghost,
                        size: .medium,
                        action: {}
                    )
                    
                    SNButton(
                        title: "Ghost S",
                        type: .ghost,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Floating Button")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    HStack {
                        SNButton(
                            title: "Floating",
                            type: .primary,
                            isFloating: true,
                            action: {}
                        )
                        
                        SNButton(
                            title: "Floating",
                            type: .primary,
                            isEnabled: false,
                            isFloating: true,
                            action: {}
                        )
                        
                        SNButton(
                            title: "",
                            type: .primary,
                            isFloating: true,
                            leadingIcon: Image("ic_plus"),
                            action: {}
                        )
                        
                        SNButton(
                            title: "",
                            type: .primary,
                            isLoading: true,
                            isFloating: true,
                            action: {}
                        )
                        
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Social Button")
                            .font(.system(size: SpacingTokens.sm, weight: .semibold))
                        Spacer()
                    }
                    
                    SNButton(
                        title: "Continue with Apple",
                        type: .appleLogin,
                        leadingIcon: Image("ic_apple"),
                        action: {}
                    )
                    
                    SNButton(
                        title: "Continue with Google",
                        type: .googleLogin,
                        leadingIcon: Image("ic_google"),
                        action: {}
                    )
                }
                
            }
            .padding()
            
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
