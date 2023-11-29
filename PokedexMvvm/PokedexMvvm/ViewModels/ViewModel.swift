//
//  ViewModel.swift
//  PokedexMvvm
//
//  Created by Thomas Cowern on 11/29/23.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokeminManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    init() {
        self.pokemonList = pokeminManager.getPokemon()
        print(self.pokemonList)
    }
}
