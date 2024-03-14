//
//  CardBackView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct CardBackView: View {
    
    // MARK: - Properties
    let creditCardInfo: CreditCardModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            Rectangle()
                .fill(.black)
                .frame(maxWidth: .infinity, maxHeight: 22)
                .padding(.top, 20)
            
            Spacer()
            
            HStack {
                Text(creditCardInfo.ccvCode)
                    .frame(width: 100, height: 33, alignment: .leading)
                    .background(.white)
                    .foregroundStyle(.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .padding([.leading, .trailing, .bottom], 20)
                
                Spacer()
            }
            
        }
        .foregroundStyle(.white)
        .frame(width: 350, height: 250)
        .background {
            LinearGradient(colors: [.red, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - Preview
#Preview {
    CardBackView(creditCardInfo: CreditCardModel(cardholderName: "Bill Smith", cardNumber: "1234-1234-1234-1234", expirationDate: "11/11", ccvCode: "123"))
}