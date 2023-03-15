//
//  DetailPokemonView.swift
//  PokemonProject
//
//  Created by Rogerio Marinner on 14/03/23.
//

import UIKit

class DetailPokemonView: UIView {
    
    let namePokemonDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.systemYellow.cgColor
        label.layer.backgroundColor = UIColor.systemBlue.cgColor
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        return label
    }()
    
    let imagePokemonDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let nameTableViewOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GameIndex"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.backgroundColor = .systemBlue
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.systemYellow.cgColor
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        return label
    }()
    
    let tableViewOne: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let nameTableViewTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Abiliity"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.backgroundColor = .systemBlue
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.systemYellow.cgColor
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        return label
    }()
    
    let tableViewTwo: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        setupNameDatail()
        setupImageDatail()
        setupNameTableViewOne()
        setupTableViewOne()
        setupNameTableViewTwo()
        setupTableViewTwo()
    }
    
    func setupNameDatail() {
        addSubview(namePokemonDetail)
        NSLayoutConstraint.activate([
            namePokemonDetail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            namePokemonDetail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            namePokemonDetail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            namePokemonDetail.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setupImageDatail() {
        addSubview(imagePokemonDetail)
        NSLayoutConstraint.activate([
            imagePokemonDetail.topAnchor.constraint(equalTo: namePokemonDetail.bottomAnchor, constant: 1),
            imagePokemonDetail.centerXAnchor.constraint(equalTo: namePokemonDetail.centerXAnchor),
            imagePokemonDetail.heightAnchor.constraint(equalToConstant: 200),
            imagePokemonDetail.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupNameTableViewOne() {
        addSubview(nameTableViewOne)
        NSLayoutConstraint.activate([
            nameTableViewOne.topAnchor.constraint(equalTo: imagePokemonDetail.bottomAnchor, constant: 10),
            nameTableViewOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameTableViewOne.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nameTableViewOne.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setupTableViewOne() {
        addSubview(tableViewOne)
        NSLayoutConstraint.activate([
            tableViewOne.topAnchor.constraint(equalTo: nameTableViewOne.bottomAnchor, constant: 2),
            tableViewOne.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tableViewOne.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            tableViewOne.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupNameTableViewTwo() {
        addSubview(nameTableViewTwo)
        NSLayoutConstraint.activate([
            nameTableViewTwo.topAnchor.constraint(equalTo: tableViewOne.bottomAnchor, constant: 10),
            nameTableViewTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameTableViewTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nameTableViewTwo.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setupTableViewTwo() {
        addSubview(tableViewTwo)
        NSLayoutConstraint.activate([
            tableViewTwo.topAnchor.constraint(equalTo: nameTableViewTwo.bottomAnchor, constant: 2),
            tableViewTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            tableViewTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            tableViewTwo.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
