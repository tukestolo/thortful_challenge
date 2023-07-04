//
//  AppCoordinator.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 04/07/2023.
//

import UIKit

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func pop()
}

class AppCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController = DefaultNavigationViewController()) {
        self.navigationController = navigationController
    }
}

extension AppCoordinator {

    func start() {

        // Here we can create a splash screen to handle this request and then show the MovieList when it is done.
        // Just done this way because to be simple.

        Task {
            let getConfiguration = GetConfiguration()
            let result = try await getConfiguration.execute()
            ImagesConfiguration.shared.images = result.images

            DispatchQueue.main.async {
                let movieListViewModel = MovieListViewModel(coordinator: self)
                let movieListViewController = MovieListViewController(viewModel: movieListViewModel)

                self.navigationController.pushViewController(movieListViewController, animated: false)
            }
        }
    }

    func pop() {
        navigationController.popViewController(animated: true)
    }

    func goToMovieDetail(movie: Movie) {
        let viewModel = MovieDetailsViewModel(movie: movie, coordinator: self)
        let viewController = MovieDetailsViewController(viewModel: viewModel)

        navigationController.pushViewController(viewController, animated: true)
    }
}
