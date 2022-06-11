//
//  SearchBarView.swift
//  Pokemon
//
//  Created by ahmed abdalla on 10/06/2022.
//
import UIKit

class SearchBarView : UICollectionReusableView {
    @IBOutlet weak var searchBar : UISearchBar!{
        didSet {
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.subviews.first?.isHidden = true
            textField.layer.backgroundColor = UIColor.systemGray6.cgColor
                         
        }
    }
    }
}


