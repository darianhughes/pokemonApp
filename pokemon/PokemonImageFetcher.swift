//
//  PokemonImageFetcher.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import Foundation

class PokemonImageFetcher: ObservableObject {
    @Published var imageURL: URL?

    func fetchImage(for name: String) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name.lowercased())") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let decoded = try? JSONDecoder().decode(PokemonDetail.self, from: data),
                  let spriteURL = decoded.sprites.front_default,
                  let url = URL(string: spriteURL) else { return }

            DispatchQueue.main.async {
                self.imageURL = url
            }
        }.resume()
    }
}
