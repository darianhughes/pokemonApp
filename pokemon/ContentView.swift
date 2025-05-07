//
//  ContentView.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var favorites: [String] = []

    var body: some View {
        TabView {
            PokemonListView(favorites: $favorites)
                .tabItem {
                    Label("Browse", systemImage: "list.bullet")
                }

            FavoritesView(favorites: $favorites)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}
