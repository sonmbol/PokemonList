//
//  PokemonListViewController.swift
//  Pokemon
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    // MARK: - Variables
    private var viewModel : PokemonListViewModel!
    private var tableViewDelegate: PokemonListDelegate!
    private var tableViewDataSource: PokemonListDataSource!

    // MARK: - OUTLET
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(cellType: PokemonTableViewCell.self)
        }
    }
    
    // MARK: - Action
    @IBAction func AddTapped(_ sender: Any) {
        addTextField(title: "Add new Pokemon", actionTitle: "Add Pokemon", placeholder: "Create new pokemon") {
            [weak self] (text) in
               guard let self = self else {   return    }
               self.viewModel.addPokemon(name: text)
        }
    }
    
    @IBAction func SaveTapped(_ sender: Any) {
        viewModel.saveChange { [weak self] success in
            guard let self = self else {   return    }
            if success {
                self.showAlert(title: "Saved!!!!", message: "")
            }
        }
    }
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = PokemonListViewModel(delegate: self)
        tableViewDelegate = PokemonListDelegate(viewModel: viewModel)
        tableViewDataSource = PokemonListDataSource(viewModel: viewModel)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    // MARK: - Confieguration
    func config(){
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }


}

// MARK: - Pokemon List ViewModel Protocol
extension PokemonListViewController : PokemonListViewModelEvent {
    func reloadData() {
        tableView?.reloadData()
    }
    
    
}

// MARK: - Alert Protocol
extension PokemonListViewController :AlertsPresenting{
                                            
}

