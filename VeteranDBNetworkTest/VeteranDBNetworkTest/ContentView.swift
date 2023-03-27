//
//  ContentView.swift
//  VeteranDBNetworkTest
//
//  Created by Thomas Cowern on 3/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        VStack {
            TextField("Username", text: $loginVM.username)
            SecureField("Password", text: $loginVM.password)
            Button("Login") {
                loginVM.login()
            }
        }
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
