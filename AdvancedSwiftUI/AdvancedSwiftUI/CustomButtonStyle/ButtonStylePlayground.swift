//
//  ButtonStylePlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
//    init(scaledAmount: CGFloat = 0.9) {
//        self.scaledAmount = scaledAmount
//    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStylePlayground: View {
    var body: some View {
        Button {
            // Action here...
        } label: {
            Text("Click Me")
                .font(.headline)
                .foregroundStyle(Color.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
        }
        .withPressableStyle()
        .padding(40)

    }
}

#Preview {
    ButtonStylePlayground()
}
