//
//  ContentView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 4/2/25.
//

import SwiftUI
import Snappstack

struct Widget {
    let titleLabel: String
    let destinationView: AnyView?
}

struct ContentView: View {
    @ObservedObject private var themeProvider = ThemeProvider.shared
    @Environment(\.colorScheme) var colorScheme // Access the current system color scheme
    @State private var overrideColorScheme: ColorScheme? = nil // Optional override
    
    let widgets: [Widget] = [
        Widget(
            titleLabel: "Buttons",
            destinationView: AnyView(ButtonComponent())
        ),
        Widget(
            titleLabel: "Textfields",
            destinationView: nil
        ),
        Widget(
            titleLabel: "Tab Bar",
            destinationView: nil
        )
    ]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 16) {
                Rectangle().frame(height: 1).foregroundColor(Color(uiColor: .systemGroupedBackground))
                HStack(spacing: 8) {
                    ThemeButton(
                        title: "System",
                        iconName: "leaf",
                        isSelected: overrideColorScheme == nil,
                        selectedColor: colorScheme == .dark ? .white : .black
                    ) {
                        colorScheme == .dark ? themeProvider.switchToDark() : themeProvider.switchToLight()
                        overrideColorScheme = nil
                    }
                    
                    ThemeButton(
                        title: "Light",
                        iconName: "sun.max",
                        isSelected: overrideColorScheme == .light,
                        selectedColor: (overrideColorScheme ?? colorScheme) == .dark ? .white : .black
                    ) {
                        overrideColorScheme = .light
                        themeProvider.switchToLight()
                    }
                    
                    ThemeButton(
                        title: "Dark",
                        iconName: "moon",
                        isSelected: overrideColorScheme == .dark,
                        selectedColor: (overrideColorScheme ?? colorScheme) == .dark ? .white : .black
                    ) {
                        overrideColorScheme = .dark
                        themeProvider.switchToDark()
                    }
                }
                .background(Color.clear)
                Rectangle().frame(height: 1).foregroundColor(Color(uiColor: .systemGroupedBackground))
                
                List{
                    Section(header: Text("Atomic Elements")
                        .font(.system(size: 16, weight: .semibold))
                        .textCase(nil)) {
                        ForEach(widgets, id: \.titleLabel) { widget in
                            NavigationLink {
                                widget.destinationView
                            } label: {
                                Text(widget.titleLabel)
                            }
                        }
                    }
                }
                .scrollDisabled(true)
                .navigationTitle("Snappstack UIKit")
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .preferredColorScheme(overrideColorScheme)
        }
        
    }
}

struct ThemeButton: View {
    let title: String
    let iconName: String
    let isSelected: Bool
    let selectedColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: iconName)
                    .font(.system(size: 24))
                Text(title)
                    .font(.system(size: 16, weight: isSelected ? .bold : .regular))
            }
            .frame(width: (UIScreen.main.bounds.width-48)/3, height: 82)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? selectedColor : Color.gray, lineWidth: isSelected ? 1.5 : 1)
            )
        }
        .foregroundColor(isSelected ? selectedColor : .gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
