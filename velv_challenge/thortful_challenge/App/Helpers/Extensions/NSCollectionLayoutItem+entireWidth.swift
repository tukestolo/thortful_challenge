//
//  NSCollectionLayoutItem+entireWidth.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import UIKit

extension NSCollectionLayoutItem {
    static func entireWidth(withHeight height: NSCollectionLayoutDimension) -> NSCollectionLayoutItem {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: height)
        return NSCollectionLayoutItem(layoutSize: itemSize)
    }
}
