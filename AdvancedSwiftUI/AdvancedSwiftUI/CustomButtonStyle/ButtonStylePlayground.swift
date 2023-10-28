//
//  ButtonStylePlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

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
        .padding(40)

    }
}

#Preview {
    ButtonStylePlayground()
}
