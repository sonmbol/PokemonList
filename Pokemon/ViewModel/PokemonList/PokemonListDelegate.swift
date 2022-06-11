//
//  PokemonListDelegate.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

class PokemonListDelegate: NSObject, UITableViewDelegate {
    // MARK: - Variables
    let viewModel: PokemonListViewModel
    
    // MARK: - Initialization
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            viewModel.selectPokemon(indexPath: indexPath, accessoryView:  &cell.accessoryView)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
