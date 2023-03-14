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
    
    var namePokemon: String {
        detailPokemon?.name ?? ""
    }
    
    var urlImage: URL? {
        URL(string: detailPokemon?.sprites?.frontDefault ?? "")
    }
    
    var numberOfRowsGameIndex: Int {
        detailPokemon?.gameIndices?.count ?? 0
    }
    
    var numberOfRowsAbility: Int {
        detailPokemon?.abilities?.count ?? 0
    }
    
    func cellForRowsGameIndex(indexPath: IndexPath) -> GameIndex? {
        return detailPokemon?.gameIndices?[indexPath.row]
    }
    
    func cellForRowsAbility(indexPath: IndexPath) -> Ability? {
        return detailPokemon?.abilities?[indexPath.row]
    }
    
    var url: String {
        result?.url ?? ""
    }
    
    func getDetailPokemon(result: Result?) {
        self.result = result
    }
    
    func requestDetailPokemonViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerDetailPokemon(urlString: url) { [weak self] detailPokemon, success in
            guard let self = self else { return }
            if success {
                self.detailPokemon = detailPokemon
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
