//
//  ListCategoryViewModel.swift
//  SimpleStoreApp
//
//  Created by Thomas Cowern on 8/17/23.
//

import Foundation
import SwiftUI

struct ListCategoryViewModel {
    
    func loadData() async -> [Category] {
        
        var results = [Category]()
        
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories") else {
            print("Invalid URL")
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([Category].self, from: data) {
                results = decodedResponse
                
            }
            
            return results
            
        } catch {
            print("Invalid data")
        }
        
        return []
    }
}
