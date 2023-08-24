//
//  ContentView.swift
//  LearnPreviews
//
//  Created by Mohammad Azam on 9/8/21.
//

// Photo by Joseph Gonzalez on Unsplash

import SwiftUI

struct ContentView: View {
    
    let dish: Dish
    
    @State private var rating: Int? = nil
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Image(dish.photos)
                    .resizable()
                Text(dish.title)
                    .font(.title)
                Text(dish.description)
                   
                RatingView(rating: $rating)
                   
                Spacer()
                
            }.padding()
            
            .navigationTitle("Today's Special")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let dish = SampleProvider.getDishSample()
        
        if let dish = dish {
            ContentView(dish: dish)
        }
        
//        Group {
//            ContentView()
//                .preferredColorScheme(.light)
//                .previewDisplayName("Light Mode")
//            
//            ContentView()
//                .preferredColorScheme(.dark)
//                .previewDisplayName("Dark Mode")
//        }
        
        
//        ForEach(ContentSizeCategory.allCases, id: \.self) { preview in
//            ContentView()
//                .environment(\.sizeCategory, preview)
//                .previewDisplayName("\(preview)")
//        }
        
//        Group {
//            ContentView()
//                .environment(\.sizeCategory, .large)
//                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
//                .previewDisplayName("iPhone SE")
//
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
//                .previewDisplayName("iPhone 12 Pro Max")
//
//            RatingView(rating: .constant(3))
//                .previewLayout(.sizeThatFits)
//        }
    }
}
