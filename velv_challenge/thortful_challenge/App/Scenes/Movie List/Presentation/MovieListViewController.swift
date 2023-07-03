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
    private var collectionView: UICollectionView?

    init(viewModel: MovieListViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView = .init(frame: .zero, collectionViewLayout: makeLayout())
        configureViews()
    }
}

extension MovieListViewController: UICollectionViewDelegate {
}

extension MovieListViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModel.viewModelForRow(indexPath.row)
        let cell = collectionView.dequeueReusableCell(ofType: MovieListCell.self, for: indexPath)

        cell.configure(with: viewModel)

        return cell
    }
}

private extension MovieListViewController {

    func makeLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout.listLayout()
    }
}

extension MovieListViewController: ConfigureView {

    func configureViewProperties() {

        if let collectionView {
            collectionView.registerCell(withType: MovieListCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self

            collectionView.collectionViewLayout = makeLayout()
        }
    }

    func configureViewEvents() {
        viewModel.didReceivedMovies = {
            [weak self] in

            DispatchQueue.main.async {
                self?.collectionView?.reloadData()
            }
        }
    }

    func configureViewHierarchy() {
        view.addSubview(collectionView!)
    }

    func configureViewLayout() {
        collectionView?.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}