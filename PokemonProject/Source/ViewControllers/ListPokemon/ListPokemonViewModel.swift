//
//  ListPokemonViewModel.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import Foundation

class ListPokemonViewModel: NSObject {
    
    private let worker = Worker()
    private var myPokemon: ListPokemon?
    
    var numberOfRows: Int {
        myPokemon?.results?.count ?? 0
    }
    
    func cellForRows(indexPath: IndexPath) -> Result? {
        return myPokemon?.results?[indexPath.row]
    }
    
    func requestListPokemonViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerListPokemon { [weak self] myPokemon, success in
            guard let self = self else { return }
            if success {
                self.myPokemon = myPokemon
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
