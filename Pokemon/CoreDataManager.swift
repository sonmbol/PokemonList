//
//  CoreDataManager.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import Foundation
import UIKit.UIApplication
import CoreData

class CoreDataManager {
    
    // MARK: - Variables
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var pokemons : [Pokemon] = []
    
    // MARK: - Get Pokemons
    func loadPokemons(with request : NSFetchRequest<Pokemon> = Pokemon.fetchRequest())->[Pokemon]{
       
        do {
            pokemons = try context.fetch(request)
        }catch{
            print("error search \(error)")
        }
        
        return pokemons
        
    }
    
    // MARK: - Get Selected Pokemons
    func selectedPokemons()->[Pokemon]{
        
        let request : NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
            
        let predicate = NSPredicate(format: "isSelected = true")
        
        request.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return loadPokemons(with: request)
        
    }
    
    // MARK: - Get Pokemons by name
    func fetechPokemons(name : String)->[Pokemon]{
        
        let request : NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
            
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@ AND isSelected = true", name)
        
        request.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return loadPokemons(with: request)
        
    }
    
    // MARK: - Get All Pokemons without Save
    func getAllPokemons()->[Pokemon]{
        return pokemons
        
    }
    
    // MARK: - Add Pokemon
    func addPokemon(name : String, completion: @escaping (Bool) -> Void){
        let pokemon = Pokemon(context: self.context)
        pokemon.name = name
        pokemon.id = Int64(pokemons.count + 1)
        pokemons.append(pokemon)
        print("count : \(pokemons.count)")
        completion(true)
    }
    
    // MARK: - update Pokemon
    func updatePokemon(id : Int64,isSelected : Bool)->Bool{
        if let currentPokemon = pokemons.filter({ $0.id ==  id}).first {
            currentPokemon.isSelected = isSelected
            return true
        }
        return false
    }
    
    // MARK: - Save Data
    func savePokemon(completion: @escaping (Bool) -> Void){
        do{
            try context.save()
        }catch{
            print("error to save \(error)")
            completion(false)
        }
        completion(true)
    }
}
