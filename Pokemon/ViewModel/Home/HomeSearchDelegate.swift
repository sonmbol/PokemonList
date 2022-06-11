//
//  HomeSearchDelegate.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

class HomeSearchDelegate : NSObject,UISearchBarDelegate {
    
    // MARK: - Variables
    let viewModel: HomeViewModel
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel.delegate?.scrollTop()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
        viewModel.didStartSearch(text: text)
        }
    }
}
