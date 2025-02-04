//
//  ContentView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 4/2/25.
//

import SwiftUI
import Snappstack

struct Widget {
    let id = UUID().uuidString
    let destinationView: AnyView?
    let label: AnyView
}

struct ContentView: View {
    @ObservedObject private var themeProvider = ThemeProvider.shared
    @Environment(\.colorScheme) var colorScheme // Access the current system color scheme
    @State private var overrideColorScheme: ColorScheme? = nil // Optional override
    
    let freeWidgets: [Widget] = [
        Widget(
            destinationView: AnyView(ButtonComponent()),
            label: AnyView(Text("Buttons"))
        ),
        Widget(
            destinationView: nil,
            label: AnyView(Text("Textfields"))
        ),
        Widget(
            destinationView: nil,
            label: AnyView(Text("Tab Bar"))
        )
    ]
    
    var body: some View {
        VStack(spacing: 32) {
            NavigationStack{
                HStack(spacing: 16) {
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
                
                List{
                    Section {
                        ForEach(freeWidgets, id: \.id) { widget in
                            NavigationLink {
                                widget.destinationView
                            } label: {
                                widget.label
                            }
                        }
                    } header: {
                        HStack {
                            Text("Atomic Elements")
                                .font(.system(size: 16, weight: .bold))
                                .textCase(nil)
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Snappstack UIKit")
            }
        }
        .preferredColorScheme(overrideColorScheme)
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
            .frame(width: 100, height: 100)
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
