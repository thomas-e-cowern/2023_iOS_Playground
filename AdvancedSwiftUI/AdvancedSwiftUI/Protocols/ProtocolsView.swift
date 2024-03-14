//
//  ProtocolsView.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 3/14/24.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .yellow
    let tertiary: Color = .green
}

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

struct ProtocolsView: View {
    
//    let colorTheme: DefaultColorTheme = DefaultColorTheme()
//    let colorTheme: AlternativeColorTheme = AlternativeColorTheme()
    let colorTheme: ColorThemeProtocol = DefaultColorTheme()
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            
            Text("Protocols are awesome")
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .clipShape(.buttonBorder)
        }
    }
}

#Preview {
    ProtocolsView()
}
