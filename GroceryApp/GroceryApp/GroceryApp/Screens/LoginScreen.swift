//
//  LoginScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/9/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    @EnvironmentObject private var appState: AppState
    
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
        .navigationTitle("Login")
    }
    
    private func login() async {
        do {
            let loginResponseDTO = try await model.login(username: username, password: password)
            if loginResponseDTO.error {
                errorMessage = loginResponseDTO.reason ?? ""
            } else {
                // take user to grocery categories
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
            .environmentObject(AppState())
    }
}
