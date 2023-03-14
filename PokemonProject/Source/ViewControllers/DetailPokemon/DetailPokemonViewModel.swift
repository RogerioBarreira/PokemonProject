//
//  DetailPokemonViewModel.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import Foundation

class DetailPokemonViewModel: NSObject {
    
    private let worker = Worker()
    private var detailPokemon: DetailPokemon?
    private var result: Result?
    
    var url: String {
        result?.url ?? ""
    }
    
    func getDetailPokemon(result: Result?) {
        self.result = result
    }
    
    func requestDetailPokemonViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerDetailPokemon(urlString: url) { detailPokemon, success in
            if success {
                self.detailPokemon = detailPokemon
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
