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

class DefaultDataSource: DataSourceProtocol, ButtonPressedProtocol {
    var buttonText: String = "Protocols are cool"
    
    func buttonPressed() {
        print("Button Cool")
    }
}

class AlternativeDataSource: DataSourceProtocol, ButtonPressedProtocol {
    var buttonText: String = "Protocols Rocks!"
    
    func buttonPressed() {
        print("Button Rocks")
    }
}

protocol DataSourceProtocol {
    var buttonText: String { get }
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

struct ProtocolsView: View {
    
    let colorTheme: ColorThemeProtocol
    let dataSource: DataSourceProtocol
    let action: ButtonPressedProtocol
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .clipShape(.buttonBorder)
                .onTapGesture {
                    action.buttonPressed()
                }
        }
    }
}

#Preview {
    ProtocolsView(colorTheme: ThirdColorTheme(), dataSource: AlternativeDataSource(), action: DefaultDataSource())
}
