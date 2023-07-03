//
//  DefaultNavigationViewController.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

import Foundation
import UIKit

class DefaultNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

private extension DefaultNavigationViewController {

    func setupNavigationBar() {

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = Asset.Colors.primary.color
        standardAppearance.titleTextAttributes = [
            .foregroundColor: Asset.Colors.secundary.color,
            .font: UIFont.systemFont(ofSize: 24, weight: .bold),
        ]

        navigationBar.standardAppearance = standardAppearance
        navigationBar.scrollEdgeAppearance = standardAppearance


        navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 24, weight: .bold)
        ]

        navigationBar.prefersLargeTitles = true
    }
}
