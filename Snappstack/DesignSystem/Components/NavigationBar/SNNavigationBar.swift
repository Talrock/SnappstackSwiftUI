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
    let leftButtons: [SNButton]
    let rightButtons: [SNButton]
    
    public init(
        title: String,
        subtitle: String? = nil,
        leftButtons: [SNButton],
        rightButtons: [SNButton]
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leftButtons = leftButtons
        self.rightButtons = rightButtons
    }
    
    public var body: some View {
        ZStack {
            HStack {
                ForEach(leftButtons.indices, id: \.self) { index in
                    leftButtons[index]
                }
                Spacer()
                ForEach(rightButtons.indices, id: \.self) { index in
                    rightButtons[index]
                }
            }
            VStack(alignment: .center, spacing: SpacingTokens.micro) {
                Text(title)
                    .font(FontTokens.headline.font)
                    .foregroundColor(ColorTokens.textPrimary)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(FontTokens.footnote.font)
                        .foregroundColor(ColorTokens.gray4)
                }
            }
        }
        .padding()
    }
}
