//
//  DetailPokemonViewController.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit

class DetailPokemonViewController: UIViewController {
    
    lazy var viewDetailPokemon: DetailPokemonView = {
        let view = DetailPokemonView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = viewDetailPokemon
    }
}
