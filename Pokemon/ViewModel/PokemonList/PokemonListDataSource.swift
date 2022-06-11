//
//  PokemonListDataSource.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

class PokemonListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Variables
    let viewModel: PokemonListViewModel
    
    // MARK: - Initialization
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: PokemonTableViewCell.self,for: indexPath)

        let cellModel = viewModel.dataSet[indexPath.row]
        if cellModel.isSelected {
            cell.accessoryView = viewModel.checkImageView
            }else{
                cell.accessoryView = nil
            }

        cell.nameLabel.text = cellModel.name
        
        return cell
    }
}
