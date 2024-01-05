//
//  ContentView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                CardFrontView()
                Spacer()
            }
            .navigationTitle("Checkout")
        }
    }
    
}

#Preview {
    ContentView()
}
