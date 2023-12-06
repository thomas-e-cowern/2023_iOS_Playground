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

struct CustomHStack<Content:View>:View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        if type == .one {
            viewOne
        } else if type == .two {
            viewTwo
        } else if type == .three {
            viewThree
        }
    }
    
    private var viewOne: some View {
        VStack {
            Text("One")
                .padding(.vertical, 10)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
    }
    
    private var viewTwo: some View {
        VStack {
            HStack {
                Text("TWO")
                Image(systemName: "heart")
            }
            .padding(.vertical, 10)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
    }
    
    private var viewThree: some View {
        VStack {
            Image(systemName: "heart.fill")
                .padding(.vertical, 10)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
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
            
            CustomHStack {
                Text("Custom H Stack")
                Image(systemName: "heart")
            }
            
            LocalViewBuilder(type: .one)
            LocalViewBuilder(type: .two)
            LocalViewBuilder(type: .three)
            
            Spacer()
        }
        
    }
}

#Preview {
    ViewbuilderPlayground()
}
