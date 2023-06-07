//
//  RegistrationScreen.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/7/23.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            
            HStack {
                Spacer()
                
                Button("Register") {
                    
                }
                
                Spacer()
            }
        }
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen()
    }
}
