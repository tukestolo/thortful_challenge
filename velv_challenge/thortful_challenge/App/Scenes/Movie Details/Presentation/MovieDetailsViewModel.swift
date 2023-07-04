//
//  MovieDetailsViewModel.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 04/07/2023.
//

import Foundation

struct MovieDetailsViewModel {

    private let movie: Movie

    private weak var coordinator: Coordinator?

    let posterURLString: String?
    let overviewText: String

    init(
        movie: Movie,
        coordinator: Coordinator? = nil
    ) {
        self.movie = movie
        overviewText = movie.overview
        self.coordinator = coordinator

        posterURLString = movie.buildPosterURLString()
    }

    func onBackButtonTapped() {
        coordinator?.pop()
    }
}
