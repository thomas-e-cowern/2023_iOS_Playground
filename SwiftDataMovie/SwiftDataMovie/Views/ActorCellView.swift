//
//  ActorCellView.swift
//  SwiftDataMovie
//
//  Created by Thomas Cowern on 7/21/23.
//

import SwiftUI

struct ActorCellView: View {
    
    let actor: Actor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(actor.name)
                .font(.title3)
                .underline()
            Text(actor.movies.map { $0.title }, format: .list(type: .and))
        }
    }
}

//#Preview {
//    ActorCellView()
//}