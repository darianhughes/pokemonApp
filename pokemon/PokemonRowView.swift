//
//  PokemonRowView.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import SwiftUI

struct PokemonRowView: View {
    let pokemon: Pokemon

    var body: some View {
        HStack {
            if let url = pokemon.spriteURL {
                AsyncImage(url: url) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView().frame(width: 50, height: 50)
                }
            }

            Text(pokemon.name.capitalized)
                .font(.headline)
        }
    }
}

