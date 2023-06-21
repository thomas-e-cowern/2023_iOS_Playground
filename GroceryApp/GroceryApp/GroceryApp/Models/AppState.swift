//
//  AppState.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/9/23.
//

import Foundation
import GroceryAppSharedDTO

enum Route: Hashable {
    case login
    case register
    case groceryCategoryList
    case groceryCategoryDetail(GroceryCategoryResonseDTO)
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
}
