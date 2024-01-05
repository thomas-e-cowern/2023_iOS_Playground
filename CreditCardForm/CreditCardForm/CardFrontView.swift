//
//  CardFrontView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct CardFrontView: View {
    
    let creditCardInfo: CreditCardModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .padding()
                Spacer()
                Text("VISA")
                    .padding(.trailing, 10)
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .italic()
            }
            
            Text(creditCardInfo.cardNumber.isEmpty ? " " : creditCardInfo.cardNumber)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Card Holder Name")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(creditCardInfo.cardholderName)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Expires")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(creditCardInfo.expirationDate)
                }
                
            }
            .padding()
            
            Spacer()
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
    CardFrontView(creditCardInfo: CreditCardModel(cardholderName: "Bill Smith", cardNumber: "1234-1234-1234-1234", expirationDate: "11/11", ccvCode: "123"))
}
