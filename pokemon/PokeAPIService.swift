//
//  PokeAPIService.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import Foundation

class PokeAPIService {
    func fetchPokemonList(completion: @escaping ([Pokemon]) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20")!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let decoded = try? JSONDecoder().decode(PokemonResponse.self, from: data) else {
                completion([])
                return
            }
            completion(decoded.results)
        }.resume()
    }

    func fetchPokemonDetails(for name: String, completion: @escaping (PokemonDetail?) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name.lowercased())")!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let detail = try? JSONDecoder().decode(PokemonDetail.self, from: data)
            completion(detail)
        }.resume()
    }
}
