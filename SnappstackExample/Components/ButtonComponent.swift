//
//  ButtonComponent.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 4/2/25.
//

import SwiftUI
import Snappstack

struct ButtonComponent: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading) {
                SnappButton(
                    title: "Primary Large",
                    type: .primary,
                    leadingIcon: Image(systemName: "message"),
                    action: {}
                )
                
                SnappButton(
                    title: "Primary Medium",
                    type: .primary,
                    size: .medium,
                    action: {}
                )
                
                SnappButton(
                    title: "Primary Small",
                    type: .primary,
                    size: .small,
                    action: {}
                )
            }
            
            
            // Secondary variants
            Group {
                SnappButton(
                    title: "Secondary",
                    type: .secondary,
                    trailingIcon: Image(systemName: "arrow.right"),
                    action: {}
                )
                
                SnappButton(
                    title: "Ghost",
                    type: .ghost,
                    action: {}
                )
                
                SnappButton(
                    title: "Loading",
                    type: .primary,
                    isLoading: true,
                    action: {}
                )
                
                SnappButton(
                    title: "Disabled",
                    type: .primary,
                    isEnabled: false,
                    action: {}
                )
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .background(.black)
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent()
    }
}
