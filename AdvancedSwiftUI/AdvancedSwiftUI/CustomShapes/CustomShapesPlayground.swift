//
//  CustomShapesPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 11/1/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}


struct CustomShapesPlayground: View {
    var body: some View {
        ZStack {
            
            Triangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
            
        }
    }
}

#Preview {
    CustomShapesPlayground()
}
