//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit


class PokemonListViewModel {
    
    // MARK: - Variables
    weak var delegate: PokemonListViewModelEvent?
    private var coreManager = CoreDataManager()
    var checkImageView : UIImageView{
    get{
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.image = UIImage(named: "check")
        imageView.tintColor = UIColor(named: "AccentColor")
        return imageView
    }
}
    var dataSet : [Pokemon] = []
    
    // MARK: - Initialization
    init(delegate : PokemonListViewModelEvent) {
        self.delegate = delegate
        loadData()
    }
    
    func loadData(){
        dataSet = coreManager.loadPokemons()
           self.delegate?.reloadData()
    }
    
    func addPokemon(name: String){
        coreManager.addPokemon(name: name) { [weak self] success in
            if success {
                if let pokemons = self?.coreManager.getAllPokemons() {
                self?.dataSet = pokemons
                self?.delegate?.reloadData()
                }
            }
        }
    }
    
    
    func selectPokemon(indexPath: IndexPath, accessoryView : inout UIView?){
        let id = dataSet[indexPath.row].id
        let isSelected = dataSet[indexPath.row].isSelected
        if coreManager.updatePokemon(id: id, isSelected: !isSelected) {
            if !isSelected {
                accessoryView = checkImageView
            }else{
                accessoryView = nil
            }
        }
        
    }
    
    
    func saveChange(completion: @escaping (Bool) -> Void){
        coreManager.savePokemon { success in
            completion(success)
        }
    }
    
   
    
    
    
}
