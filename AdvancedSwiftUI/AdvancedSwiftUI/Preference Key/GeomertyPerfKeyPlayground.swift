//
//  GeomertyPerfKeyPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 12/16/23.
//

import SwiftUI

struct GeomertyPerfKeyPlayground: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            Spacer()
            HStack {
                Rectangle()
                
                GeometryReader(content: { geo in
                    Rectangle()
                        .updateRectangleCGSize(geo.size)
                })

                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometryPrefenceKey.self, perform: { value in
            self.rectSize = value
        })
    }
}

extension View {
    func updateRectangleCGSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometryPrefenceKey.self, value: size)
    }
}

struct RectangleGeometryPrefenceKey: PreferenceKey {

    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }

}

#Preview {
    GeomertyPerfKeyPlayground()
}
