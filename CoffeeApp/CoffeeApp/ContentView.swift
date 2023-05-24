//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Thomas Cowern on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CoffeeModel
    
    var body: some View {
        VStack {
            List(model.orders) { order in
                Text(order.name ?? "")
            }
            .task {
                await populateOrders()
            }
            
            .padding()
        }
    }
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        } catch {
            print(error.localizedDescription)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CoffeeModel(webService: WebService()))
    }
}
