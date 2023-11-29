//
//  PokemonView.swift
//  PokedexMvvm
//
//  Created by Thomas Cowern on 11/29/23.
//

import SwiftUI

struct PokemonView: View {
    
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensions, height: dimensions)
                
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
                
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
            
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
