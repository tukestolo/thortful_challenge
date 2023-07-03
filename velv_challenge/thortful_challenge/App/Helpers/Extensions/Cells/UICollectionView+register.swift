//
//  UICollectionView+register.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import UIKit

extension UICollectionView {

    func registerCell<T: UICollectionViewCell>(withType type: T.Type) {
        switch CellRegistrationType(forClass: type) {
        case let .withNib(nib, identifier):
            register(nib, forCellWithReuseIdentifier: identifier)
        case let .withClass(aClass, identifier):
            register(aClass, forCellWithReuseIdentifier: identifier)
        }
    }
}
