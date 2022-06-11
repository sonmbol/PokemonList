//
//  HomeViewController.swift
//  Pokemon
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    private var viewModel : HomeViewModel!
    private var collectionViewDataSource: HomeDataSource!
    private var collectionViewDelegate: HomeDelegate!
    private var profileBarItem: UIBarButtonItem {
        get{
            let rightBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
            let profileImage = UIImage(named: "me")?.resizeImage(to: CGSize(width: 40, height: 40))
            rightBarButton.setImage(profileImage, for: .normal)
            rightBarButton.borderColor = .systemGroupedBackground
            rightBarButton.borderWidth = 2
            rightBarButton.cornerRadius = 20
            return UIBarButtonItem(customView: rightBarButton)
        }
    }
    
    // MARK: - OUTLET
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(cellType: PokemonCollectionViewCell.self)
        }
    }
    @IBOutlet weak var SheetTopContraint: NSLayoutConstraint!
    
    
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = HomeViewModel(delegate: self)
        collectionViewDataSource = HomeDataSource(viewModel: viewModel)
        collectionViewDelegate = HomeDelegate(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadData()
    }
    
    // MARK: - Confieguration
    func config(){
        navigationItem.rightBarButtonItem = profileBarItem
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
    }
    
}

// MARK: - Home ViewModel Protocol
extension HomeViewController : HomeViewModelEvent{
    
    func reloadData() {
        collectionView?.reloadData()
    }
    
    func scrollTop() {
        UIView.animate(withDuration: 0.15) {[weak self] in
            self?.SheetTopContraint.constant = 10
            self?.view.layoutIfNeeded()
        }
    }
    
    func scrollBottom() {
        UIView.animate(withDuration: 0.15) {[weak self] in
            self?.SheetTopContraint.constant = 165
            self?.view.layoutIfNeeded()
        }
    }
    
    func didScroll(contentOffset: CGPoint) {
        if (contentOffset.y <= 0){
            scrollBottom()
        }else{
            scrollTop()
        }
    }
    
}
