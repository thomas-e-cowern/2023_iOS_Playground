//
//  ContentView.swift
//  NavigationStackAPI
//
//  Created by Thomas Cowern on 3/22/23.
//

import SwiftUI

struct Customer: Hashable {
//    var id = UUID()
    let name: String
    let accountNumber: Int
}

struct DetailView: View {
    
    let value: Int
    
    var body: some View {
        Text("Value: \(value)")
    }
}

struct CustomerView: View {
    
    let name: String
    
    var body: some View {
        Text("Name: \(name)")
    }
}

struct CustomerDetailView: View {
    
    let customer: Customer
    
    var body: some View {
        HStack {
            Text("Name: \(customer.name)")
            Text("Account number: \(customer.accountNumber)")
        }
    }
}

struct ContentView: View {
    
    let customers = [Customer(name: "John", accountNumber: 00001), Customer(name: "Mary", accountNumber: 00002), Customer(name: "Bernice", accountNumber: 00003), Customer(name: "Quentin", accountNumber: 00004)]
    
    var body: some View {
        NavigationStack {
            
            List(customers, id: \.self) { customer in
                NavigationLink(customer.name, value: customer)
            }
            .navigationDestination(for: Customer.self) { customer in
                CustomerDetailView(customer: customer)
            }
            
            VStack (spacing: 20){
                NavigationLink("DetailView", value: 99)
                    
                NavigationLink("CustomerView", value: "John Doe")
            }
            .navigationDestination(for: Int.self) { value in
                DetailView(value: value)
            }
            
            .navigationDestination(for: String.self) { value in
                CustomerView(name: value)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
