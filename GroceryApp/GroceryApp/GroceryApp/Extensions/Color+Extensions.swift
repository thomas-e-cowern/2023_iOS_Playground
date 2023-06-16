//
//  Color+Extensions.swift
//  GroceryApp
//
//  Created by Thomas Cowern on 6/16/23.
//

import Foundation
import SwiftUI

extension Color {
    static func fromHex(_ hexCode: String) -> Color {
        
        let scanner = Scanner(string: hexCode.replacingOccurrences(of: "#", with: ""))
        var hexNumber: UInt64 = 0
        scanner.scanHexInt64(&hexNumber)
        
        let red = Double((hexNumber & 0xff0000) >> 16) / 255.0
        let green = Double((hexNumber & 0xff00) >> 8) / 255.0
        let blue = Double(hexNumber & 0xff) / 255.0
        
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
}
