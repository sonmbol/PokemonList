//
//  HomeViewModelEvent.swift
//  Pokemon
//
//  Created by ahmed abdalla on 11/06/2022.
//

import Foundation
import CoreGraphics

protocol HomeViewModelEvent :AnyObject {
    func reloadData()
    func scrollTop()
    func scrollBottom()
    func didScroll(contentOffset : CGPoint)
}
