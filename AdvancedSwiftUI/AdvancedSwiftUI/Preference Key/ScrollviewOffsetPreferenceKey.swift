//
//  ScrollviewOffsetPreferenceKey.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 12/16/23.
//

import SwiftUI

struct ScrollviewOffsetPreferenceKey: View {
    
    let title: String = "New Title Here"
    
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    titleLayer
                        .opacity(scrollViewOffset / 75.0)
                        .background(
                            GeometryReader { geo in
                                Text("")
                                    .preference(key: ScrollviewOffsetPreferenceKeyKey.self, value: geo.frame(in: .global).minY)
                            }
                        )
                    
                    contentLayer
                }
                .padding()
            }
            .overlay(
                Text("\(scrollViewOffset)")
            )
            .onPreferenceChange(ScrollviewOffsetPreferenceKeyKey.self, perform: { value in
                scrollViewOffset = value
            })
            .overlay(
                navbarLayer
                    .opacity(scrollViewOffset < 40 ? 1.0 : 0.0)
                ,alignment: .top
            )
        }
    }
}

extension ScrollviewOffsetPreferenceKey {
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<100) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navbarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}

struct ScrollviewOffsetPreferenceKeyKey: PreferenceKey {
 
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ScrollviewOffsetPreferenceKey()
}
