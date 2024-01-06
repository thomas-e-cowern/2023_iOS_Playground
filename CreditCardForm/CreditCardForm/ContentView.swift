//
//  ContentView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var creditCardInfo = CreditCardModel()
    @State private var flip: Bool = false
    @State private var degrees: Double = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    if !flip {
                        CardFrontView(creditCardInfo: creditCardInfo)
                        
                    } else {
                        CardBackView(creditCardInfo: creditCardInfo)
                    }
                }
                .rotation3DEffect(
                    .degrees(degrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                
                Spacer()
                CheckoutFormView(creditCardInfo: $creditCardInfo) {
                    withAnimation {
                        degrees += 180
                        flip.toggle()
                    }
                }
            }
            .navigationTitle("Checkout")
        }
    }
    
}

#Preview {
    ContentView()
}
