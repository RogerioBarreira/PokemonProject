//
//  ListPokemon.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listPokemon = try? JSONDecoder().decode(ListPokemon.self, from: jsonData)

import Foundation

// MARK: - ListPokemon
struct ListPokemon: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let url: String?
}
