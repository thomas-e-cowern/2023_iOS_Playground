//
//  ArcsQuadsPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 11/1/23.
//

import SwiftUI

struct ArcsQuadsPlayground: View {
    var body: some View {
        ShapeWithArc()
//            .stroke(lineWidth: 5)
            .frame(width: 200, height: 200)
            
    }
}

#Preview {
    ArcsQuadsPlayground()
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 40),
                clockwise: true)
        }
    }
}

struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // Top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // Top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            // Bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))'
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY - 65),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false)
            
            // Mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}

struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY),
                control: CGPoint(x: rect.midX, y: rect.midY)
            )
        }
    }
}
