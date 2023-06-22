//
//  RegistrationScreen.swift
//  GroceryApp
//
//  Created by Mohammad Azam on 5/7/23.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @EnvironmentObject private var model: GroceryModel
    @EnvironmentObject private var appState: AppState
    
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && (password.count >= 6 && password.count <= 10)
    }
    
    private func register() async {
        
        do {
            let registerResponseDTO = try await model.register(username: username, password: password)
            print(registerResponseDTO)
            if !registerResponseDTO.error {
                // take the user to the login screen
                appState.routes.append(.login)
            } else {
                errorMessage = registerResponseDTO.reason ?? ""
            }
           
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            
            HStack {
                Button("Register") {
                    Task {
                        await register()
                    }
                }
                .buttonStyle(.borderless)
                .disabled(!isFormValid)
                
                Spacer()
                
                Button("Login") {
                    appState.routes.append(.login)
                }
                .buttonStyle(.borderless)
            }
            
            Text(errorMessage)
            
        }
        .navigationTitle("Registration")
    }
}

struct RegistrationScreenContainer: View {
    
    @StateObject private var model = GroceryModel()
    @StateObject private var appState = AppState()
    
    var body: some View {
        NavigationStack(path: $appState.routes) {
            RegistrationScreen()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .register:
                        RegistrationScreen()
                    case .login:
                        LoginScreen()
                    case .groceryCategoryList:
                        GroceryCategoryListScreen()
                    case .groceryCategoryDetail(let groceryCategory):
                        GroceryDetailScreen(groceryCategory: groceryCategory)
                    }
                }
        }
        .environmentObject(model)
        .environmentObject(appState)
    }
    
    
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreenContainer()
    }
}
