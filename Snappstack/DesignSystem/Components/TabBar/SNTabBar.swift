//
//  SNTabBar.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 17/2/25.
//

import SwiftUI

public enum LinePosition {
    case top, bottom, none
}

public struct SNTabBarItem {
    public init(
        title: String? = nil,
        icon: Image,
        selectedIcon: Image? = nil,
        badge: Int? = 0
    ) {
        self.title = title
        self.icon = icon
        self.selectedIcon = selectedIcon
        self.badge = badge
    }
    var title: String? = nil
    let icon: Image
    var selectedIcon: Image? = nil
    var badge: Int? = 0
}

struct BadgeView: View {
    var count: Int
    
    var body: some View {
        Text(count > 99 ? "99+" : "\(count)")
            .font(FontTokens.caption2.font)
            .foregroundColor(ColorTokens.white)
            .padding(.vertical, SpacingTokens.micro)
            .padding(.horizontal, 6)
            .background(Color.red)
            .clipShape(Capsule())
            .frame(minWidth: SpacingTokens.md, minHeight: SpacingTokens.md)
    }
}

struct lineView: View {
    let showLine: Bool
    let selectedColor: Color
    
    var body: some View {
        Rectangle().fill(showLine ? selectedColor : .clear).frame(height: SpacingTokens.line).transition(.opacity)
    }
}

public struct SNTabBar: View {
    let items: [SNTabBarItem]
    let linePosition: LinePosition
    @Binding var selectedIndex: Int
    var selectedColor: Color
    
    public init(
        items: [SNTabBarItem],
        linePosition: LinePosition = .none,
        selectedIndex: Binding<Int>,
        selectedColor: Color
    ) {
        self.items = items
        self.linePosition = linePosition
        self._selectedIndex = selectedIndex
        self.selectedColor = selectedColor
    }
    
    public var body: some View {
        HStack (spacing: 0){
            ForEach(items.indices, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    ZStack (alignment: .top) {
                        VStack(spacing: SpacingTokens.xxxs) {
                            lineView(showLine: linePosition == .top &&  selectedIndex == index, selectedColor: selectedColor)
                            
                            VStack(spacing: SpacingTokens.micro) {
                                (selectedIndex == index ? (items[index].selectedIcon ?? items[index].icon) : items[index].icon)
                                    .font(FontTokens.caption1.font)
                                    .foregroundColor(selectedIndex == index ? selectedColor : ColorTokens.gray4)
                                
                                if let title = items[index].title {
                                    Text(title)
                                        .foregroundColor(selectedIndex == index ? selectedColor : ColorTokens.gray4)
                                        .font(FontTokens.caption1.font)
                                }
                            }
                            lineView(showLine: linePosition == .bottom &&  selectedIndex == index, selectedColor: selectedColor)
                        }
                        if let badge = items[index].badge, badge > 0 {
                            BadgeView(count: badge).offset(x: SpacingTokens.md, y: 0)
                        }
                    }
                    .frame(height: SpacingTokens.TabBar)
                    
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
