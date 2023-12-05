//
//  ViewbuilderPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 12/5/23.
//

import SwiftUI

struct HeaderViewRegular: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Title")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Description")
                .font(.callout)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct ViewbuilderPlayground: View {
    var body: some View {
        VStack {
            
            HeaderViewRegular()
            
            Spacer()
        }
        
    }
}

#Preview {
    ViewbuilderPlayground()
}
