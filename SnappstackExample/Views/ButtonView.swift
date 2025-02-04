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
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Active Button")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    
                    SnappButton(
                        title: "Primary L",
                        type: .primary,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Primary M",
                        type: .primary,
                        size: .medium,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Primary S",
                        type: .primary,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Button Properties")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    
                    SnappButton(
                        title: "Message",
                        type: .primary,
                        leadingIcon: Image("ic_chat"),
                        action: {}
                    )
                    
                    SnappButton(
                        title: "",
                        type: .primary,
                        isLoading: true,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Next",
                        type: .primary,
                        trailingIcon: Image("ic_right"),
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Primary Disabled Button")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    SnappButton(
                        title: "Primary L",
                        type: .primary,
                        isEnabled: false,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Primary M",
                        type: .primary,
                        size: .medium,
                        isEnabled: false,
                        action: {}
                    )
                    
                    SnappButton(
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
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    
                    SnappButton(
                        title: "Secondary L",
                        type: .secondary,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Secondary M",
                        type: .secondary,
                        size: .medium,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Secondary S",
                        type: .secondary,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Tertiary Button")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    
                    SnappButton(
                        title: "Tertiary L",
                        type: .tertiary,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Tertiary M",
                        type: .tertiary,
                        size: .medium,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Tertiary S",
                        type: .tertiary,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Ghost Button")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    
                    SnappButton(
                        title: "Ghost L",
                        type: .ghost,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Ghost M",
                        type: .ghost,
                        size: .medium,
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Ghost S",
                        type: .ghost,
                        size: .small,
                        action: {}
                    )
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Floating Button")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    
                    HStack {
                        SnappButton(
                            title: "Floating",
                            type: .primary,
                            isFloating: true,
                            action: {}
                        )
                        
                        SnappButton(
                            title: "Floating",
                            type: .primary,
                            isEnabled: false,
                            isFloating: true,
                            action: {}
                        )
                        
                        SnappButton(
                            title: "",
                            type: .primary,
                            isFloating: true,
                            leadingIcon: Image("ic_plus"),
                            action: {}
                        )
                        
                        SnappButton(
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
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                    }
                    
                    SnappButton(
                        title: "Continue with Apple",
                        type: .appleLogin,
                        leadingIcon: Image("ic_apple"),
                        action: {}
                    )
                    
                    SnappButton(
                        title: "Continue with Google",
                        type: .googleLogin,
                        leadingIcon: Image("ic_google"),
                        action: {}
                    )
                    
                    //                    SnappButton(
                    //                        title: "Ghost S",
                    //                        leadingIcon: Image(systemName: "message"),
                    //                        type: .ghost,
                    //                        size: .small,
                    //                        action: {}
                    //                    )
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
