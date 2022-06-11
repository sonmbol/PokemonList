//
//  HomeDelegate.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import UIKit

class HomeDelegate: NSObject,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    // MARK: - Variables
    let viewModel: HomeViewModel
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width - 45) / 2  , height: (collectionView.frame.width - 45) / 2 )
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        viewModel.delegate?.didScroll(contentOffset: scrollView.contentOffset)
    }

}
