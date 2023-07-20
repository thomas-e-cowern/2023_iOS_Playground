//
//  ActorListView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/20/23.
//

import SwiftUI
import SwiftData

struct ActorListView: View {
    
    let actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            Text(actor.name)
        }
    }
}

#Preview {
    ActorListView(actors: [])
}
