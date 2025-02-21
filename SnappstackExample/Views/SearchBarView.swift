//
//  SearchBarView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 21/2/25.
//

import SwiftUI
import Snappstack

struct SearchBarView: View {
    @State private var searchText1: String = ""
    @State private var searchText2: String = ""
    @State private var searchText3: String = ""
    @State private var searchText4: String = ""
    @State private var isSearching1: Bool = false
    @State private var isSearching2: Bool = false
    @State private var isSearching3: Bool = false
    @State private var isSearching4: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: SpacingTokens.xl) {
                SNSearchBar(searchText: $searchText1, leadingIcon: Image("ic_search"), enableClearButton: true, isSearching: $isSearching1)
                SNSearchBar(searchText: $searchText2, leadingIcon: Image("ic_search"), trailingIcon: Image("ic_micro"), isSearching: $isSearching2)
                SNSearchBar(searchText: $searchText3, leadingIcon: Image("ic_search"), enableCancelButton: false, isSearching: $isSearching3)
                SNSearchBar(searchText: $searchText4, leadingIcon: Image("ic_search"), cancelButtonTitle: "Annuler", isSearching: $isSearching4)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
