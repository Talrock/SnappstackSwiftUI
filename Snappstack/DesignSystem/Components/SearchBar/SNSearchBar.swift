//
//  SNSearchBar.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 21/2/25.
//

import SwiftUI

public struct SNSearchBar: View {
    @Binding var searchText: String
    var leadingIcon: Image? = nil
    var trailingIcon: Image? = nil
    var enableClearButton: Bool = false
    var enableCancelButton: Bool = true
    var cancelButtonTitle: String = "Cancel"
    @Binding var isSearching: Bool
    
    public init(searchText: Binding<String>,
                leadingIcon: Image? = nil,
                trailingIcon: Image? = nil,
                enableClearButton: Bool = false,
                enableCancelButton: Bool = true,
                cancelButtonTitle: String = "Cancel",
                isSearching: Binding<Bool>) {
        
        self._searchText = searchText
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.enableClearButton = enableClearButton
        self.enableCancelButton = enableCancelButton
        self.cancelButtonTitle = cancelButtonTitle
        self._isSearching = isSearching
    }
    
    public var body: some View {
        HStack {
            HStack {
                (leadingIcon != nil ? leadingIcon : Image(systemName: "magnifyingglass"))
                    .foregroundColor(ColorTokens.gray5)
                
                TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                    withAnimation {
                        isSearching = isEditing || !searchText.isEmpty
                    }
                })
                .padding(.vertical, SpacingTokens.xxs)
                .foregroundColor(ColorTokens.textPrimary)
                
                (trailingIcon != nil ? trailingIcon : nil)
                    .foregroundColor(ColorTokens.gray5)
                
                if !searchText.isEmpty && trailingIcon == nil && enableClearButton {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(ColorTokens.gray4)
                    }
                }
            }
            .frame(height: SpacingTokens.nabBar)
            .padding(.horizontal, SpacingTokens.xs)
            .background(ColorTokens.gray1)
            .cornerRadius(SpacingTokens.nabBar/2)
            
            if isSearching && enableCancelButton {
                Button(cancelButtonTitle) {
                    searchText = ""
                    withAnimation {
                        isSearching = false
                    }
                }
                .foregroundColor(ColorTokens.accent)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .padding(.horizontal)
        .animation(.easeInOut, value: isSearching)
    }
}
