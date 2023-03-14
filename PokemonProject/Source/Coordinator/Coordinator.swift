//
//  Coordinator.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit

class Coordinator: NSObject {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        if navigationController == nil {
            self.navigationController = UINavigationController()
        }
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    func startListPokemon() {
        let viewController = ListPokemonViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func startDetailPokemon(result: Result?) {
        let viewController = DetailPokemonViewController()
        viewController.viewModelDetailPokemon.getDetailPokemon(result: result)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
