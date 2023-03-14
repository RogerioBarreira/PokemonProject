//
//  ListPokemonViewController.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    lazy var viewListPokemon: LisyPokemonView = {
        let view = LisyPokemonView()
        view.backgroundColor = .systemBackground
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = viewListPokemon
    }
}
