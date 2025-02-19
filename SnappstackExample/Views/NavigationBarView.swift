//
//  NavigationBarView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 19/2/25.
//

import SwiftUI
import Snappstack

struct NavigationBarView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: SpacingTokens.xl) {
                SNNavigationBar(title: "Title",
                                leftButton: SNButton(
                                    title: "",
                                    type: .plain,
                                    alignment: .leading,
                                    size: .small,
                                    isFloating: true,
                                    leadingIcon: Image("ic_back"),
                                    action: {}
                                ),
                                rightButton: SNButton(
                                    title: "",
                                    type: .plain,
                                    alignment: .trailing,
                                    size: .small,
                                    isFloating: true,
                                    leadingIcon: Image("ic_menu"),
                                    action: {}
                                ))
                
                SNNavigationBar(title: "Title",
                                subtitle: "Subtitle",
                                leftButton: SNButton(
                                    title: "",
                                    type: .secondary,
                                    size: .small,
                                    isFloating: true,
                                    leadingIcon: Image("ic_back_small"),
                                    action: {}
                                ),
                                rightButton: SNButton(
                                    title: "",
                                    type: .secondary,
                                    size: .small,
                                    isFloating: true,
                                    leadingIcon: Image("ic_menu_small"),
                                    action: {}
                                ))
                
                SNNavigationBar(title: "Title",
                                subtitle: "Subtitle",
                                leftButton: SNButton(
                                    title: "",
                                    type: .plain,
                                    alignment: .leading,
                                    size: .small,
                                    isFloating: true,
                                    leadingIcon: Image("ic_back"),
                                    action: {}
                                ),
                                rightButton: SNButton(
                                    title: "",
                                    type: .plain,
                                    alignment: .trailing,
                                    size: .small,
                                    isFloating: true,
                                    leadingIcon: Image("ic_menu"),
                                    action: {}
                                ))
                SNNavigationBar(title: "Title",
                                subtitle: "Subtitle",
                                leftButton: SNButton(
                                    title: "",
                                    type: .plain,
                                    alignment: .leading,
                                    size: .small,
                                    isFloating: true,
                                    leadingIcon: Image("ic_back"),
                                    action: {}
                                ),
                                rightButton: SNButton(
                                    title: "Skip",
                                    type: .plain,
                                    alignment: .trailing,
                                    size: .medium,
                                    titleColor: ColorTokens.accent,
                                    isFloating: true,
                                    action: {}
                                ))
            }
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
