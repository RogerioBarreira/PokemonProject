//
//  DetailPokemonViewController.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit
import SDWebImage

class DetailPokemonViewController: UIViewController {
    
    let viewModelDetailPokemon = DetailPokemonViewModel()
    
    lazy var viewDetailPokemon: DetailPokemonView = {
        let view = DetailPokemonView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRequest()
        setupTableViews()
    }
    
    override func loadView() {
        self.view = viewDetailPokemon
    }
    
    func setupTableViews() {
        setupTableViewOne()
        setupTableViewTwo()
    }
    
    func setupTableViewOne() {
        viewDetailPokemon.tableViewOne.dataSource = self
        viewDetailPokemon.tableViewOne.register(CellDetailPokemonTableViewCell.self, forCellReuseIdentifier: CellDetailPokemonTableViewCell.identifier)
    }
    
    func setupTableViewTwo() {
        viewDetailPokemon.tableViewTwo.dataSource = self
        viewDetailPokemon.tableViewTwo.register(CellDetailPokemonTableViewCell.self, forCellReuseIdentifier: CellDetailPokemonTableViewCell.identifier)
    }
    
    func setupUI() {
        setupNamePokemon()
        setupImagePokemon()
    }
    
    func setupNamePokemon() {
        viewDetailPokemon.namePokemonDetail.text = viewModelDetailPokemon.namePokemon
    }
    
    func setupImagePokemon() {
        viewDetailPokemon.imagePokemonDetail.sd_setImage(with: viewModelDetailPokemon.urlImage)
    }
    
    func setupRequest() {
        viewModelDetailPokemon.requestDetailPokemonViewModel { [weak self] success in
            guard let self = self else { return }
            if success {
                self.setupUI()
                self.viewDetailPokemon.tableViewOne.reloadData()
                self.viewDetailPokemon.tableViewTwo.reloadData()
            } else {
                self.showErrorMessage()
            }
        }
    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: Types.alertControllerTitle.rawValue, message: Types.alertMessage.rawValue, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: Types.alertActionTitle.rawValue, style: .destructive)
        alert.addAction(buttonOK)
        self.present(alert, animated: true, completion: nil)
    }
}

extension DetailPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == viewDetailPokemon.tableViewOne {
            return viewModelDetailPokemon.numberOfRowsGameIndex
        } else {
            return viewModelDetailPokemon.numberOfRowsAbility
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == viewDetailPokemon.tableViewOne {
            if let cell = viewDetailPokemon.tableViewOne.dequeueReusableCell(withIdentifier: CellDetailPokemonTableViewCell.identifier, for: indexPath) as? CellDetailPokemonTableViewCell {
                cell.setupCellGameIndex(gameIndex: viewModelDetailPokemon.cellForRowsGameIndex(indexPath: indexPath))
                return cell
            }
        } else {
            if let cell = viewDetailPokemon.tableViewTwo.dequeueReusableCell(withIdentifier: CellDetailPokemonTableViewCell.identifier, for: indexPath) as? CellDetailPokemonTableViewCell {
                cell.setupCellAbility(ability: viewModelDetailPokemon.cellForRowsAbility(indexPath: indexPath))
                return cell
            }
        }
        return UITableViewCell()
    }
}
