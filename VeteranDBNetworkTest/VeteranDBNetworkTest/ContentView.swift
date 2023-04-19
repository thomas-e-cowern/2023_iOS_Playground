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
        VStack (spacing: 10) {
            TextField("Username", text: $loginVM.username)
                .padding(10)
                .border(.black)
                .textInputAutocapitalization(.never)
                .frame(width: 200, height: 45)
            SecureField("Password", text: $loginVM.password)
                .padding(10)
                .border(.black)
                .textInputAutocapitalization(.never)
                .frame(width: 200, height: 45)
            Button("Login") {
                loginVM.login()
            }
            .buttonStyle(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
