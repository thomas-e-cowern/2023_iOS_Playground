//
//  OrderCellView.swift
//  CoffeeApp
//
//  Created by Thomas Cowern on 5/24/23.
//

import SwiftUI

struct OrderCellView: View {
    
    var order: Order
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.name ?? "").accessibilityIdentifier("orderNameText")
                    .bold()
                Text("\(order.coffeeName) (\(order.size.rawValue))")
                    .accessibilityIdentifier("coffeeNameAndSizeText")
                    .opacity(0.5)
                
            }
            Spacer()
            Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                .accessibilityIdentifier("coffeePriceText")
        }
    }
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCellView()
    }
}
