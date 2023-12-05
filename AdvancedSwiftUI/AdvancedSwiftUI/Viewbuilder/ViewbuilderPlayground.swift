//
//  ViewbuilderPlayground.swift
//  AdvancedSwiftUI
//
//  Created by Thomas Cowern on 12/5/23.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Title")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<Content:View>: View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
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
            
            HeaderViewRegular(title: "Test title", description: nil)
            HeaderViewRegular(title: "Another title", description: "This is a descrtiption")
            
            HeaderViewGeneric(title: "Generic") {
                HStack {
                    Text("Hello")
                    Image(systemName: "mail")
                }
            }
            
            Spacer()
        }
        
    }
}

#Preview {
    ViewbuilderPlayground()
}
