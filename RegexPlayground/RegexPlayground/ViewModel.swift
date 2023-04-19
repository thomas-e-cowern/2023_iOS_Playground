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
    
    @Published var replacementOutput = ""
    @Published var matches = [Match]()
    @Published var isValid = true
    
    var code: String {
        """
        import Foundation

        let input = \"""
        \(inputString)
        \"""

        let regex = /\(pattern)/
        let replacement = "\(replacement)"
        let results = input.matches(of: regex)

        for result in results {
            let matchText = String(input[result.range])
            print("Found \\(matchText)")
        }

        let output = input.replacing(regex, with: replacement)
        print(output)
        """
    }
    
    func update() {
        guard pattern.isEmpty == false else { return }
        print("Running pattern...")
        
        do {
            let regex = try Regex(pattern)
            let results = inputString.matches(of: regex)
            replacementOutput = inputString.replacing(regex, with: replacement)
            isValid = true
            
            matches = results.compactMap({ result in
                let wholeText = String(inputString[result.range])
                if wholeText.isEmpty { return nil }
                
                var wholeMatch = Match(text: wholeText, position: result.range.position(in: inputString))
                
                if result.count > 1 {
                    wholeMatch.groups = [Match]()
                    
                    for part in result.indices.dropFirst() {
                        let match = result[part]
                        guard let range = match.range else { continue }
                        
                        let matchText = String(inputString[range])
                        if matchText.isEmpty { continue }
                        
                        let partMatch = Match(text: matchText, position: range.position(in: inputString))
                        wholeMatch.groups?.append(partMatch)
                    }
                }
                
                return wholeMatch
            })
        } catch {
            matches.removeAll()
            replacementOutput = ""
            isValid = false
        }
    }
}
