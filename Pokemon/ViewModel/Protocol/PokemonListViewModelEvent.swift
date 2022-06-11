//
//  PokemonListViewModelEvent.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import Foundation

protocol PokemonListViewModelEvent :AnyObject {
    func reloadData()
}
