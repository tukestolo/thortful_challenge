//
//  NSCollectionLayoutSection+listSection.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import UIKit

extension NSCollectionLayoutSection {

    static func listSection(
        withEstimatedHeight estimatedHeight: CGFloat = 100,
        directionalEdgeInsets: NSDirectionalEdgeInsets
    ) -> NSCollectionLayoutSection {
        let layoutItem = NSCollectionLayoutItem.withEntireSize()
        layoutItem.contentInsets = directionalEdgeInsets

        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(estimatedHeight))

        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        layoutGroup.interItemSpacing = .fixed(10)

        return NSCollectionLayoutSection(group: layoutGroup)
    }

    static func groupSection(
        withEstimatedHeight estimatedHeight: CGFloat = 60,
        directionalEdgeInsets: NSDirectionalEdgeInsets
    ) -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = directionalEdgeInsets

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1/4))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: layoutItem,
            count: 3
        )

        group.interItemSpacing = .fixed(8)

        return NSCollectionLayoutSection(group: group)
    }
}
