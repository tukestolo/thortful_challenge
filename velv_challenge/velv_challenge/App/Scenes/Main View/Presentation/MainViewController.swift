//
//  MainViewController.swift
//  velv_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    private let viewModel: MainViewModel

    init(viewModel: MainViewModel = .init()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController: ConfigureView {

    func configureViewProperties() {
        view.backgroundColor = .red
    }
}
