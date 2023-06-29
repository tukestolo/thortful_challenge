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
        // standardAppearance.backgroundImage = backImageForDefaultBarMetrics

        let compactAppearance = standardAppearance.copy()
        // compactAppearance.backgroundImage = backImageForLandscapePhoneBarMetrics

        navigationBar.standardAppearance = standardAppearance
        navigationBar.scrollEdgeAppearance = standardAppearance
        navigationBar.compactAppearance = compactAppearance

        navigationBar.compactScrollEdgeAppearance = compactAppearance

//           let appearance = UINavigationBarAppearance()
//           appearance.backgroundEffect = nil
//           appearance.backgroundColor = Asset.Colors.cellBackground.color
//           appearance.shadowImage = UIImage()
//           appearance.shadowColor = .clear
//           appearance.titleTextAttributes = [
//               .foregroundColor: Asset.Colors.primaryBlack.color,
//               .font: UIFont.systemFont(ofSize: 15, weight: .bold),
//           ]
//
//           navigationBar.standardAppearance = appearance
//           navigationBar.scrollEdgeAppearance = appearance
    }
}
