//
//  CellRegistrationType.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation
import UIKit.UINib

// Should only be used in the context of UICollectionViewExtension and UITableViewExtension
enum CellRegistrationType {
    case withNib(UINib, String)
    case withClass(AnyClass, String)

    init(forClass aClass: AnyClass) {
        let identifier = CellRegistrationType.identifier(forClass: aClass)
        if Bundle.main.path(forResource: identifier, ofType: "nib") != nil {
            let nib = UINib(nibName: identifier, bundle: .main)
            self = .withNib(nib, identifier)
        } else {
            self = .withClass(aClass, identifier)
        }
    }

    init(forIdentifier aIdentifier: String) {
        if Bundle.main.path(forResource: aIdentifier, ofType: "nib") != nil {
            let nib = UINib(nibName: aIdentifier, bundle: .main)
            self = .withNib(nib, aIdentifier)
        } else {
            guard let aClass = NSClassFromString(aIdentifier) else { fatalError("Class doesn't exist") }
            self = .withClass(aClass, aIdentifier)
        }
    }

    static func identifier(forClass aClass: AnyClass) -> String {
        return String(describing: aClass)
    }
}
