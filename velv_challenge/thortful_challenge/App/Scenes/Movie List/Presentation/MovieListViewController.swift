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
    private let refreshControl = UIRefreshControl()
    private var hasImageAnimatedTransitioning: HasImageAnimatedTransitioning?

    init(viewModel: MovieListViewModel = .init(coordinator: AppCoordinator())) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView = .init(
            frame: .zero,
            collectionViewLayout: makeLayout()
        )

        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension MovieListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) as? MovieListCell {
            hasImageAnimatedTransitioning = cell
            viewModel.onDidSelectItemAt(row: indexPath.row)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastSectionIndex = collectionView.numberOfSections - 1
        let lastItemIndex = collectionView.numberOfItems(inSection: lastSectionIndex) - 1

        if
            indexPath.section == lastSectionIndex &&
            indexPath.item == lastItemIndex {
            viewModel.onEndListReached()
        }
    }
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

extension MovieListViewController: HasImageAnimatedTransitioning {

    func getImageViewForTransition() throws -> UIImageView {
        guard
            let hasImageAnimatedTransitioning = hasImageAnimatedTransitioning
        else { throw PushAnimationsFactory.Error.noCustomTransitionDesired }

        return try hasImageAnimatedTransitioning.getImageViewForTransition()
    }
}

private extension MovieListViewController {

    func makeLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout.groupLayout()
    }

    @objc private func refreshData() {
        viewModel.onRefreshControllPressed()
        refreshControl.endRefreshing()
    }
}

extension MovieListViewController: ConfigureView {

    func configureViewProperties() {
        title = viewModel.title

        view.backgroundColor = Asset.Colors.primary.color
        collectionView?.backgroundColor = Asset.Colors.primary.color

        if let collectionView {
            collectionView.registerCell(withType: MovieListCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self

            collectionView.collectionViewLayout = makeLayout()

            refreshControl.addTarget(
                self,
                action: #selector(refreshData), for: .valueChanged
            )

            collectionView.refreshControl = refreshControl
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
        view.addOptionalSubview(collectionView)
    }

    func configureViewLayout() {

        collectionView?.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
    }
}
