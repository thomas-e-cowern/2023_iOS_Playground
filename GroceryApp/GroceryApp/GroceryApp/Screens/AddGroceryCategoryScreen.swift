//
//  AddGroceryCategoryScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import SwiftUI

struct AddGroceryCategoryScreen: View {
    
    @State private var title: String = ""
    @State private var colorCode: String = Constants.defaultColor
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
        }
    }
}

struct AddGroceryCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddGroceryCategoryScreen()
    }
}
