//
//  MatchedGeometryEffectPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 10/30/23.
//

import SwiftUI

struct MatchedGeometryEffectPlayground: View {
    
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100, height: 100)
            
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

#Preview {
    MatchedGeometryEffectPlayground()
}
