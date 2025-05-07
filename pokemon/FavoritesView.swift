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
                        HStack {
                            //if let url = getSpriteURL(for: name) {
                                //AsyncImage(url: url) { image in
                                    //image.resizable()
                                         //.scaledToFit()
                                         //.frame(width: 50, height: 50)
                                //} placeholder: {
                                    //ProgressView().frame(width: 50, height: 50)
                                //}
                            //}

                            Text(name.capitalized)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

func getSpriteURL(for name: String) -> URL? {
    let nameToIndex: [String: Int] = [
        "bulbasaur": 1, "ivysaur": 2, "venusaur": 3,
        "charmander": 4, "charmeleon": 5, "charizard": 6,
        "squirtle": 7, "wartortle": 8, "blastoise": 9,
        // ... add more or automate if needed
    ]
    guard let index = nameToIndex[name.lowercased()] else { return nil }
    return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(index).png")
}

