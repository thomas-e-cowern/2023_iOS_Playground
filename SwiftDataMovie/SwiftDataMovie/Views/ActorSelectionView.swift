//
//  ActorSelectionView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/21/23.
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {
    
    @Query(sort: \.name, order: .forward)
    private var actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            HStack {
                Image(systemName: "square")
                Text(actor.name)
            }
        }
    }
}

#Preview {
    ActorSelectionView()
}
