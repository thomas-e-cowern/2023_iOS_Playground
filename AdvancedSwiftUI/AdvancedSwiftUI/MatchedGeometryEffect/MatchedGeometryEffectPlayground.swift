//
//  MatchedGeometryEffectPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/30/23.
//

import SwiftUI

struct MatchedGeometryEffectPlayground: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
                    
            }
            
            Spacer()
            
            
            if isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
                    
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectPlayground()
}
