//
//  AppState.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/9/23.
//

import Foundation

enum Route: Hashable {
    case login
    case register
    case groceryCategoryList
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
}
