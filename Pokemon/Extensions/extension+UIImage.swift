//
//  UIImage.swift
//  Pokemon
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
       return UIGraphicsImageRenderer(size: size).image { _ in
           draw(in: CGRect(origin: .zero, size: size))
    }
}}
