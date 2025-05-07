//
//  PokemonDetailView.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import SwiftUI

struct PokemonDetailView: View {
    let name: String
    @Binding var favorites: [String]
    @State private var detail: PokemonDetail?
    let api = PokeAPIService()

    var body: some View {
        VStack(spacing: 20) {
            if let detail = detail {
                if let url = detail.sprites.front_default,
                   let imageURL = URL(string: url) {
                    AsyncImage(url: imageURL) { image in
                        image.resizable().scaledToFit().frame(height: 150)
                    } placeholder: {
                        ProgressView()
                    }
                }

                Text("Types: \(detail.types.map { $0.type.name.capitalized }.joined(separator: ", "))")
                Text("Abilities: \(detail.abilities.map { $0.ability.name.capitalized }.joined(separator: ", "))")

                Button(favorites.contains(name) ? "Unfavorite" : "Favorite") {
                    if let index = favorites.firstIndex(of: name) {
                        favorites.remove(at: index)
                    } else {
                        favorites.append(name)
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            } else {
                ProgressView()
            }
        }
        .padding()
        .navigationTitle(name.capitalized)
        .onAppear {
            api.fetchPokemonDetails(for: name) { result in
                DispatchQueue.main.async {
                    self.detail = result
                }
            }
        }
    }
}
