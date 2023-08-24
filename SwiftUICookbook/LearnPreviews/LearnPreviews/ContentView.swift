//
//  ContentView.swift
//  LearnPreviews
//
//  Created by Mohammad Azam on 9/8/21.
//

// Photo by Joseph Gonzalez on Unsplash

import SwiftUI

struct ContentView: View {
    
    @State private var rating: Int? = nil
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Image("food")
                    .resizable()
                Text("French Toast")
                    .font(.title)
                Text("This classic French Toast recipe is easy, uses simple pantry ingredients, and has a secret ingredient that makes a thicker batter with cinnamon sugar flavors that really set it apart. It’s one of our family’s favorite breakfasts!")
                   
                RatingView(rating: $rating)
                   
                Spacer()
                
            }.padding()
            
            .navigationTitle("Today's Special")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
                .previewDisplayName("iPhone SE")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")
            
            RatingView(rating: .constant(3))
                .previewLayout(.sizeThatFits)
        }
    }
}
