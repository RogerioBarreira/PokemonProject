//
//  CellDetailPokemonTableViewCell.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit

class CellDetailPokemonTableViewCell: UITableViewCell {

    static var identifier = "CellDetailPokemonTableViewCell"
    
    let cellPokemon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.label.cgColor
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configConstrains()
    }
    
    func configConstrains() {
        setupNamePokemon()
    }
    
    func setupNamePokemon() {
        contentView.addSubview(cellPokemon)
        NSLayoutConstraint.activate([
            cellPokemon.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellPokemon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            cellPokemon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cellPokemon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            cellPokemon.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func setupCellGameIndex(gameIndex: GameIndex?) {
        cellPokemon.text = gameIndex?.version?.name ?? ""
    }
    
    func setupCellAbility(ability: Ability?) {
        cellPokemon.text = ability?.ability?.name ?? "" 
    }
}
