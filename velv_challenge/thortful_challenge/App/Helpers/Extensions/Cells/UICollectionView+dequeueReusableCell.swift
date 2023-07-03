//
//  UICollectionView+dequeueReusableCell.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import UIKit

extension UICollectionView {

    func dequeueReusableCell<V: UICollectionViewCell>(ofType type: V.Type, for indexPath: IndexPath) -> V {
        let identifier = CellRegistrationType.identifier(forClass: V.self)
        let optionalCell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? V

        guard let cell = optionalCell else {
            fatalError("Something went wrong when dequeuing cell of type \(String(describing: V.self))")
        }

        cell.accessibilityIdentifier = identifier

        return cell
    }
}
