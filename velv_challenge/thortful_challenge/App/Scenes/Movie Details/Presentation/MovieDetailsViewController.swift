//
//  MovieDetailsViewController.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 04/07/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController, UIViewControllerTransitioningDelegate {

    private let viewModel: MovieDetailsViewModel
    private let backgroundImageView = UIImageView()
    private let backButton = UIButton()

    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

private extension MovieDetailsViewController {

    @objc func buttonTapped() {
        viewModel.onBackButtonTapped()
    }
}

extension MovieDetailsViewController: HasImageAnimatedTransitioning {

    func getImageViewForTransition() throws -> UIImageView {
        backgroundImageView
    }
}

extension MovieDetailsViewController: ConfigureView {

    func configureViewProperties() {
        if
            let posterURLString = viewModel.posterURLString,
            let posterURL = URL(string: posterURLString) {
            backgroundImageView.af.setImage(withURL: posterURL)
            backgroundImageView.contentMode = .scaleAspectFill
        }

        view.backgroundColor = Asset.Colors.primary.color

        backButton.setImage(UIImage(systemName: "arrowshape.backward.fill"), for: .normal)

        backButton.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside
        )
    }

    func configureViewHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(backButton)
    }

    func configureViewLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.equalToSuperView()
        }

        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(50)
        }
    }
}
