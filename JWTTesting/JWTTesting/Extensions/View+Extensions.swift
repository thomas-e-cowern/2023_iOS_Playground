//
//  View+Extensions.swift
//  JWTTesting
//
//  Created by Thomas Cowern on 3/17/23.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
