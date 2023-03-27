//
//  LoginViewModel.swift
//  VeteranDBNetworkTest
//
//  Created by Thomas Cowern on 3/26/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    var username: String = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    func login() {
        
        let defaults = UserDefaults.standard
        
        Webservice().login(username: username, password: password) { result in
            switch result {
                case .success(let token):
                print(token)
                    defaults.setValue(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func signout() {
           
       let defaults = UserDefaults.standard
       defaults.removeObject(forKey: "jsonwebtoken")
       DispatchQueue.main.async {
           self.isAuthenticated = false
       }
    }
}

