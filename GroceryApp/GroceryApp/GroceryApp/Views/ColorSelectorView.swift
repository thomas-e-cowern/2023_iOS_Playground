//
//  ColorSelectorView.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI

enum Colors: String, CaseIterable {
    case green = "#2ecc71"
    case red = "#e74c3c"
    case blue = "#3498db"
    case purple = "#9b59b6"
    case yellow = "#f1c40f"
}

struct ColorSelectorView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ColorSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectorView()
    }
}
