//
//  ViewModel.swift
//  RegexPlayground
//
//  Created by Thomas Cowern on 3/28/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @AppStorage("pattern") var pattern = "" { didSet { update() } }
    @AppStorage("inputStorage") var inputString = "Text to match here..." { didSet { update() } }
    @AppStorage("replacement") var replacement = "" { didSet { update() } }
    
    @Published var replacementOutpu = ""
    @Published var matches = [Match]()
    @Published var isValid = true
    
    var code: String {
        "Hello Swift!"
    }
    
    func update() {
        guard pattern.isEmpty == false else { return }
        print("Running pattern...")
    }
}

