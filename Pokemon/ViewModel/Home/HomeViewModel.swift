//
//  HomeViewModel.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit


class HomeViewModel {
    // MARK: - Variables
    weak var delegate: HomeViewModelEvent?
    private var coreManager = CoreDataManager()
    var dataSet : [Pokemon] = []
    
    // MARK: - Initialization
    init(delegate : HomeViewModelEvent) {
        self.delegate = delegate
    }
    
    
    func didStartSearch(text : String) {
        if text.replacingOccurrences(of: " ", with: "") != "" {
        dataSet = coreManager.fetechPokemons(name: text)
        }else{
            dataSet = coreManager.selectedPokemons()
        }
        delegate?.scrollBottom()
        delegate?.reloadData()
    }
    
    func reloadData() {
        dataSet = coreManager.selectedPokemons()
        delegate?.reloadData()
    }
}
