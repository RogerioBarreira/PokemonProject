//
//  CellListPokemonTableViewCell.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit

class CellListPokemonTableViewCell: UITableViewCell {
    
    static var identifier = "CellListPokemonTableViewCell"
    
    let namePokemon: UILabel = {
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
        contentView.addSubview(namePokemon)
        NSLayoutConstraint.activate([
            namePokemon.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            namePokemon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            namePokemon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            namePokemon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            namePokemon.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func setupCell(pokemon: Result?) {
        namePokemon.text = pokemon?.name ?? ""
    }
}
