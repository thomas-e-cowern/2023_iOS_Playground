//
//  ContentView.swift
//  CustomProgressView
//
//  Created by Thomas Cowern on 10/10/23.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    var trimAmount = 0.7
    var strokeColor = Color.blue
    var strokeWidth = 25.0
    
    var rotation: Angle {
        Angle(radians: .pi * (1 - trimAmount)) + Angle(radians: .pi / 2)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .rotation(rotation)
                .trim(from: 0, to: CGFloat(trimAmount))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
            
            Circle()
                .rotation(rotation)
                .trim(from: 0, to: CGFloat(trimAmount) * CGFloat(fractionCompleted))
                .stroke(strokeColor.opacity(0.5), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
        }
    }
}

struct ContentView: View {
    
    @State private var progress = 0.2
    
    var body: some View {
        ProgressView("Label", value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200)
            .onTapGesture {
                if progress < 1.0 {
                    withAnimation {
                        progress += 0.2
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
