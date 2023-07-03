//
//  NSCollectionLayoutSection+listSection.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import UIKit

extension NSCollectionLayoutSection {
    static func listSection(withEstimatedHeight estimatedHeight: CGFloat = 100, edgesInsets: NSDirectionalEdgeInsets) -> NSCollectionLayoutSection {
        let layoutItem = NSCollectionLayoutItem.withEntireSize()
        layoutItem.contentInsets = edgesInsets

        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(estimatedHeight))

        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        layoutGroup.interItemSpacing = .fixed(10)

        return NSCollectionLayoutSection(group: layoutGroup)
    }
}
