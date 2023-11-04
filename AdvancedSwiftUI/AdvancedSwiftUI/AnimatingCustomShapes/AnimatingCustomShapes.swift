//
//  AnimatingCustomShapes.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 11/4/23.
//

import SwiftUI

struct AnimatingCustomShapes: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
            Pacman(offsetAmount: animate ? 20 : 0)
//            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
                .frame(width: 230, height: 230)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Pacman: Shape {
    
    var offsetAmount: Double
    
    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to:  CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: offsetAmount),
                        endAngle: Angle(degrees: 360 - offsetAmount),
                        clockwise: false)
        }
    }
}

#Preview {
    AnimatingCustomShapes()
}
