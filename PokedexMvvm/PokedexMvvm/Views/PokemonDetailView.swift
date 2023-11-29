//
//  PokemonDetailView.swift
//  PokedexMvvm
//
//  Created by Thomas Cowern on 11/29/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 10) {
                Text("ID: \(vm.pokemonDetails?.id ?? 0)")
                Text("Weight: \(vm.pokemonDetails?.weight ?? 0)")
                Text("Height: \(vm.pokemonDetails?.height ?? 0)")
            }
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
