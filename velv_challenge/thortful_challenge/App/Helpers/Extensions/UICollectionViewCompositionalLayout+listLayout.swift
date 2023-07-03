//
//  UICollectionViewCompositionalLayout+listLayout.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import UIKit

extension UICollectionViewCompositionalLayout {

    static func listLayout(directionalEdgeInsets: NSDirectionalEdgeInsets = .zero) -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(
            section: .listSection(
                withEstimatedHeight: 200,
                directionalEdgeInsets: directionalEdgeInsets
            )
        )
    }
}
