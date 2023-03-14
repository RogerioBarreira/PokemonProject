//
//  ListPokemonViewController.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit

class ListPokemonViewController: UIViewController {
    
    let viewModelListPokemon = ListPokemonViewModel()
    
    lazy var viewListPokemon: ListPokemonView = {
        let view = ListPokemonView()
        view.backgroundColor = .systemBackground
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRequest()
    }
    
    override func loadView() {
        self.view = viewListPokemon
    }
    
    func setupTableView() {
        viewListPokemon.myTableView.delegate = self
        viewListPokemon.myTableView.dataSource = self
        viewListPokemon.myTableView.register(CellListPokemonTableViewCell.self, forCellReuseIdentifier: CellListPokemonTableViewCell.identifier)
    }
    
    func setupRequest() {
        
        viewModelListPokemon.requestListPokemonViewModel { [weak self] success in
            guard let self = self else { return }
            if success {
                self.viewListPokemon.myTableView.reloadData()
            } else {
                print("Erro Request")
            }
        }
    }
}

extension ListPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelListPokemon.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = viewListPokemon.myTableView.dequeueReusableCell(withIdentifier: CellListPokemonTableViewCell.identifier, for: indexPath) as? CellListPokemonTableViewCell {
            cell.setupCell(pokemon: viewModelListPokemon.cellForRows(indexPath: indexPath))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startDetailPokemon(result: viewModelListPokemon.cellForRows(indexPath: indexPath))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
