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
        NavigationStack{
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
                    Text("Atomic Elements")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.vertical, 4)
                }
            }
            .navigationTitle("Snappstack UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
