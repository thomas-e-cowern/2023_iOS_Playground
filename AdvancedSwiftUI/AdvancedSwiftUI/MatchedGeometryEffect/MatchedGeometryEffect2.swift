//
//  MatchedGeometryEffect2.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/31/23.
//

import SwiftUI

struct MatchedGeometryEffect2: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = "Home"
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace)
                            .frame(width: 35, height: 4)
                            .offset(y: 20)
                    }
                    
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    MatchedGeometryEffect2()
}
