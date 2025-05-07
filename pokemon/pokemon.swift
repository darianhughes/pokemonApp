//
//  pokemon.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct PokemonDetail: Codable {
    let sprites: Sprites
    let types: [PokemonTypeEntry]
    let abilities: [PokemonAbilityEntry]
}

struct Sprites: Codable {
    let front_default: String?
}

struct PokemonTypeEntry: Codable {
    let type: TypeName
}

struct TypeName: Codable {
    let name: String
}

struct PokemonAbilityEntry: Codable {
    let ability: AbilityName
}

struct AbilityName: Codable {
    let name: String
}
