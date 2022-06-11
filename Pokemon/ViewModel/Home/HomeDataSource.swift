//
//  HomeDataSource.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    // MARK: - Variables
    let viewModel: HomeViewModel
    var searchDelegate: HomeSearchDelegate!
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        searchDelegate = HomeSearchDelegate(viewModel: viewModel)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataSet.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(with: PokemonCollectionViewCell.self,for: indexPath)
        let cellModel = viewModel.dataSet[indexPath.row]
        cell.nameLabel.text = cellModel.name
        
        return cell
    }
    
    
    // MARK: Header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let searchView = collectionView.dequeueReusableSupplementaryView(ofKind:  UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath) as! SearchBarView
        searchView.searchBar.delegate =  searchDelegate
        
        return searchView
    }
    
    
    
}
