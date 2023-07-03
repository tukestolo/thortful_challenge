//
//  MovieListViewController.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

import Foundation
import UIKit

class MovieListViewController: UIViewController {

    private let viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel = .init()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieListViewController: ConfigureView {

    func configureViewProperties() {
        view.backgroundColor = .red
    }
}
