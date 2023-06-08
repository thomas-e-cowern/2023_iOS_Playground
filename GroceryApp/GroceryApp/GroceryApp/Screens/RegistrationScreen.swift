//
//  RegistrationScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/7/23.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && (password.count >= 6 && password.count <= 10)
    }
    
    var body: some View {
        
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            
            HStack {
                Spacer()
                
                Button("Register") {
                    Task {
                        await register()
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(!isFormValid)
                
                Spacer()
            }
        }
    }
    
    private func register() async {
        do {
            let registered = try await model.register(username: username, password: password)
            if registered {
                // go to login screen
            } else {
                // show error
            }
        } catch {
            print(error)
        }
    }

}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
            .environmentObject(GroceryModel())
    }
}
