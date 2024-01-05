//
//  ContentView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var creditCardInfo = CreditCardModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                CardFrontView()
                Spacer()
                CheckoutFormView(creditCardInfo: $creditCardInfo)
            }
            .navigationTitle("Checkout")
        }
    }
    
}

#Preview {
    ContentView()
}
