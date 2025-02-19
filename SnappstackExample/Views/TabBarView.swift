//
//  TabBarView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 17/2/25.
//

import SwiftUI
import Snappstack

struct TabBarView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: SpacingTokens.xl) {
                SNTabBar(
                    items: [
                        SNTabBarItem(
                            title: "Home",
                            icon: Image("ic_home"),
                            selectedIcon: Image("ic_home_selected")
                        ),
                        SNTabBarItem(
                            title: "Message",
                            icon: Image("ic_chat"),
                            selectedIcon: Image("ic_chat_selected"),
                            badge: 12
                        ),
                        SNTabBarItem(
                            title: "Search",
                            icon: Image("ic_search"),
                            selectedIcon: Image("ic_search_selected")
                        ),
                        SNTabBarItem(
                            title: "Notifications",
                            icon: Image("ic_notification"),
                            selectedIcon: Image("ic_notification_selected")
                        ),
                        SNTabBarItem(
                            title: "Profile",
                            icon: Image("ic_profile"),
                            selectedIcon: Image("ic_profile_selected")
                        )
                    ],
                    linePosition: .none,
                    selectedIndex: $selectedIndex,
                    selectedColor: ColorTokens.textPrimary
                )
                
                SNTabBar(
                    items: [
                        SNTabBarItem(
                            title: "Home",
                            icon: Image("ic_home"),
                            selectedIcon: Image("ic_home_selected")
                        ),
                        SNTabBarItem(
                            title: "Message",
                            icon: Image("ic_chat"),
                            selectedIcon: Image("ic_chat_selected")
                        ),
                        SNTabBarItem(
                            title: "Search",
                            icon: Image("ic_search"),
                            selectedIcon: Image("ic_search_selected")
                        ),
                        SNTabBarItem(
                            title: "Notifications",
                            icon: Image("ic_notification"),
                            selectedIcon: Image("ic_notification_selected"),
                            badge: 1
                        ),
                        SNTabBarItem(
                            title: "Profile",
                            icon: Image("ic_profile"),
                            selectedIcon: Image("ic_profile_selected")
                        )
                    ],
                    linePosition: .top,
                    selectedIndex: $selectedIndex,
                    selectedColor: ColorTokens.textPrimary
                )
                
                SNTabBar(
                    items: [
                        SNTabBarItem(
                            title: "Home",
                            icon: Image("ic_home")
                        ),
                        SNTabBarItem(
                            title: "Message",
                            icon: Image("ic_chat"),
                            badge: 3
                        ),
                        SNTabBarItem(
                            title: "Search",
                            icon: Image("ic_search")
                        ),
                        SNTabBarItem(
                            title: "Notifications",
                            icon: Image("ic_notification")
                        ),
                        SNTabBarItem(
                            title: "Profile",
                            icon: Image("ic_profile")
                        )
                    ],
                    linePosition: .none,
                    selectedIndex: $selectedIndex,
                    selectedColor: ColorTokens.textPrimary
                )
                
                SNTabBar(
                    items: [
                        SNTabBarItem(
                            title: "Home",
                            icon: Image("ic_home")
                        ),
                        SNTabBarItem(
                            title: "Message",
                            icon: Image("ic_chat")
                        ),
                        SNTabBarItem(
                            title: "Search",
                            icon: Image("ic_search")
                        ),
                        SNTabBarItem(
                            title: "Notifications",
                            icon: Image("ic_notification")
                        ),
                        SNTabBarItem(
                            title: "Profile",
                            icon: Image("ic_profile")
                        )
                    ],
                    linePosition: .top,
                    selectedIndex: $selectedIndex,
                    selectedColor: ColorTokens.textPrimary
                )
                
                SNTabBar(
                    items: [
                        SNTabBarItem(
                            icon: Image("ic_home"),
                            selectedIcon: Image("ic_home_selected")
                        ),
                        SNTabBarItem(
                            icon: Image("ic_chat"),
                            selectedIcon: Image("ic_chat_selected")
                        ),
                        SNTabBarItem(
                            icon: Image("ic_search"),
                            selectedIcon: Image("ic_search_selected")
                        ),
                        SNTabBarItem(
                            icon: Image("ic_notification"),
                            selectedIcon: Image("ic_notification_selected"),
                            badge: 3
                        ),
                        SNTabBarItem(
                            icon: Image("ic_profile"),
                            selectedIcon: Image("ic_profile_selected")
                        )
                    ],
                    linePosition: .none,
                    selectedIndex: $selectedIndex,
                    selectedColor: ColorTokens.textPrimary
                )
                
                SNTabBar(
                    items: [
                        SNTabBarItem(
                            icon: Image("ic_home"),
                            selectedIcon: Image("ic_home_selected")
                        ),
                        SNTabBarItem(
                            icon: Image("ic_chat"),
                            selectedIcon: Image("ic_chat_selected"),
                            badge: 6
                        ),
                        SNTabBarItem(
                            icon: Image("ic_search"),
                            selectedIcon: Image("ic_search_selected")
                        ),
                        SNTabBarItem(
                            icon: Image("ic_notification"),
                            selectedIcon: Image("ic_notification_selected")
                        ),
                        SNTabBarItem(
                            icon: Image("ic_profile"),
                            selectedIcon: Image("ic_profile_selected")
                        )
                    ],
                    linePosition: .top,
                    selectedIndex: $selectedIndex,
                    selectedColor: ColorTokens.textPrimary
                )
                
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
