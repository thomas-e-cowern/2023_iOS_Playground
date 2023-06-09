//
//  LoginScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/9/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && (password.count >= 6 && password.count <= 10)
    }
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            
            HStack {
                Button("Log In") {
                    Task {
                        await login()
                    }
                }.buttonStyle(.borderless)
                    .disabled(!isFormValid)
            }
            
            Text(errorMessage)
            
        }
        .navigationTitle("Registration")
    }
    
    private func login() async {
        do {
            let isLoggedIn = try await model.login(username: username, password: password)
            if isLoggedIn.error {
                // go the grocery category screen
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .environmentObject(GroceryModel())
    }
}
