//
//  ViewModel.swift
//  RegexPlayground
//
//  Created by Thomas Cowern on 3/28/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @AppStorage("pattern") var pattern = ""
    @AppStorage("inputStorage") var inputString = "Text to match here..."
    @AppStorage("replacement") var replacement = ""
    
    var replacementOutpu = ""
    var matches = [Match]()
    var isValid = true
    
    var code: String {
        "Hello Swift!"
    }
    
    func update() {
        guard pattern.isEmpty == false else { return }
        print("Running pattern...")
    }
}

