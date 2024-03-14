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

struct ThirdColorTheme: ColorThemeProtocol {
    var primary: Color = .orange
    var secondary: Color = .cyan
    var tertiary: Color = .teal
}

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

class DefaultDataSource: DataSourceProtocol {
    var buttonText: String = "Protocols are cool"
}

class AlternativeDataSource: DataSourceProtocol {
    var buttonText: String = "Protocols Rock!"
}

protocol DataSourceProtocol {
    var buttonText: String { get }
}

struct ProtocolsView: View {
    
    let colorTheme: ColorThemeProtocol
    let dataSource: DataSourceProtocol
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .clipShape(.buttonBorder)
        }
    }
}

#Preview {
    ProtocolsView(colorTheme: ThirdColorTheme(), dataSource: AlternativeDataSource())
}
