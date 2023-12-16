//
//  ScrollviewOffsetPreferenceKey.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 12/16/23.
//

import SwiftUI

struct ScrollviewOffsetPreferenceKey: View {
    
    let title: String = "New Title Here"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<100) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.3))
                            .frame(width: 300, height: 200)
                    }
                }
                .padding()
            }
            .overlay(
                Text(title)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.blue)
                ,alignment: .top
            )
        }
    }
}

#Preview {
    ScrollviewOffsetPreferenceKey()
}
