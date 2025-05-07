//
//  PokemonListView.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import SwiftUI

struct PokemonListView: View {
    @State private var pokemons: [Pokemon] = []
    @State private var search = ""
    @Binding var favorites: [String]
    let api = PokeAPIService()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Pokémon", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Search") {
                    api.fetchPokemonDetails(for: search.lowercased()) { detail in
                        if let detail = detail {
                            DispatchQueue.main.async {
                                self.pokemons = [Pokemon(name: search, url: "")]
                            }
                        }
                    }
                }

                List(pokemons) { pokemon in
                    NavigationLink(destination: PokemonDetailView(name: pokemon.name, favorites: $favorites)) {
                        PokemonRowView(pokemon: pokemon)
                    }
                }
                .onAppear {
                    api.fetchPokemonList { list in
                        DispatchQueue.main.async {
                            self.pokemons = list
                        }
                    }
                }
            }
            .navigationTitle("Pokémon Finder")
        }
    }
}
