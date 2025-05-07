//
//  FavoritesView.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var favorites: [String]

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites, id: \.self) { name in
                    NavigationLink(destination: PokemonDetailView(name: name, favorites: $favorites)) {
                        Text(name.capitalized)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
