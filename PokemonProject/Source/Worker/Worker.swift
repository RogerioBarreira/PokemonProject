//
//  Worker.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import Foundation

class Worker: NSObject {
    
    private let requestGenerics = RequestGenerics()
    private var myPokemon: ListPokemon?
    private var myPokemonDetail: DetailPokemon?
    
    func workerListPokemon(completion: @escaping(ListPokemon?,Bool) -> Void) {
        requestGenerics.requestGenerics(urlString: "https://pokeapi.co/api/v2/pokemon/", method: .get, custom: ListPokemon.self) { [weak self] myPokemon, success in
            guard let self = self else { return }
            if success {
                self.myPokemon = myPokemon
                completion(myPokemon,true)
            } else {
                completion(nil,false)
            }
        }
    }
    
    func workerDetailPokemon(urlString: String, completion: @escaping (DetailPokemon?,Bool)-> Void) {
        requestGenerics.requestGenerics(urlString: urlString, method: .get, custom: DetailPokemon.self) { myDetailPokemon, success in
            if success {
                self.myPokemonDetail = myDetailPokemon
                completion(myDetailPokemon,true)
            } else {
                completion(nil,false)
            }
        }
    }
}
