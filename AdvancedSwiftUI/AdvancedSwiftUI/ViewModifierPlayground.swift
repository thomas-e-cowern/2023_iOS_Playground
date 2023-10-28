//
//  ViewModifierPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/28/23.
//

import SwiftUI

struct ViewModifierPlayground: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .font(.headline)
                .foregroundStyle(Color.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
        }
    }
}

#Preview {
    ViewModifierPlayground()
}
