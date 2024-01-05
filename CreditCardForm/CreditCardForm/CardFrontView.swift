//
//  CardFrontView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct CardFrontView: View {
    var body: some View {
        VStack {
            
        }
        .foregroundStyle(.white)
        .frame(width: 350, height: 250)
        .background {
            LinearGradient(colors: [.red, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CardFrontView()
}
