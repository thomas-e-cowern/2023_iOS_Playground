//
//  CheckoutFormView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct CheckoutFormView: View {
    
    @Binding var creditCardInfo: CreditCardModel
    @FocusState private var isCCVFocused: Bool
    let onCCVFocused: () -> Void
    
    var body: some View {
        Form {
            TextField("Cardholder Name", text: $creditCardInfo.cardholderName)
            TextField("Card Number", text: $creditCardInfo.cardNumber)
            TextField("Exiration Date", text: $creditCardInfo.expirationDate)
            TextField("CCV", text: $creditCardInfo.ccvCode)
                .focused($isCCVFocused)
        }
        .onChange(of: isCCVFocused) { oldValue, newValue in
            onCCVFocused()
        }
    }
}

//#Preview {
//    CheckoutFormView(creditCardInfo: .constant(CreditCardModel(cardholderName: "Bill Smith", cardNumber: "1234-1234-1234-1234", expirationDate: "11/11", ccvCode: "123")), onCCVFocused: () -> Void)
//}
