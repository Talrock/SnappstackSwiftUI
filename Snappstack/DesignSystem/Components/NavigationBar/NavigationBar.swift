//
//  NavigationBar.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 19/2/25.
//

import SwiftUI

public struct SNNavigationBar: View {
    let title: String
    let subtitle: String?
    let leftButton: SNButton
    let rightButton: SNButton
    
    public init(
        title: String,
        subtitle: String? = nil,
        leftButton: SNButton,
        rightButton: SNButton
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leftButton = leftButton
        self.rightButton = rightButton
        
    }
    
    public var body: some View {
        HStack {
            leftButton
            Spacer()
            VStack(alignment: .center, spacing: 2) {
                Text(title)
                    .font(FontTokens.headline.font)
                    .foregroundColor(ColorTokens.textPrimary)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(FontTokens.footnote.font)
                        .foregroundColor(ColorTokens.gray4)
                }
            }
            Spacer()
            rightButton
        }
        .padding()
    }
}


//        .background(Color.white)
//        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
