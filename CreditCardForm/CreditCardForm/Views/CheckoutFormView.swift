//
//  CheckoutFormView.swift
//  CreditCardForm
//
//  Created by Thomas Cowern on 1/5/24.
//

import SwiftUI

struct CheckoutFormView: View {
    
    // MARK: - Properties
    @Binding var creditCardInfo: CreditCardModel
    @FocusState private var isCCVFocused: Bool
    let onCCVFocused: () -> Void
    
    // MARK: - Body
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
