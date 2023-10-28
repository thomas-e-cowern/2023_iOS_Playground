//
//  ViewModifierPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let font: Font
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    func withDefaultButtonFormatting(font: Font, color: Color) -> some View {
        self
            .modifier(DefaultButtonViewModifier(font: font, color: color))
    }
}

struct ViewModifierPlayground: View {
    var body: some View {
        VStack (spacing: 8) {
            Text("Hello World")
                .modifier(DefaultButtonViewModifier(font: .headline, color: .blue))
            
            Text("What's New?")
                .withDefaultButtonFormatting(font: .footnote, color: .red)
        }
        .padding()
    }
}

#Preview {
    ViewModifierPlayground()
}
