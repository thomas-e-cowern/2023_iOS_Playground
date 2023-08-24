//
//  SampleProvider.swift
//  LearnPreviews
//
//  Created by Thomas Cowern on 8/24/23.
//

import Foundation

class SampleProvider {
    
    static func getDishSample() -> Dish? {
        guard let url = Bundle.main.url(forResource: "sample-dish", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            fatalError("The resource was not found")
        }
        
        let dish = try? JSONDecoder().decode(Dish.self, from: data)
        return dish
    }
    
    
    
}
