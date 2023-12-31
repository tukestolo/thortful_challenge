//
//  MoviesRepository.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

class MoviesRepository: MoviesRepositoryProtocol {

    private var webService: GenericWebService

    init(webService: GenericWebService = MoviesWebService()) {
        self.webService = webService
    }

    func popular(page: Int) async throws -> MovieResult {
        webService.path = MoviesPath.popular(page: page).path

        let result: TMDbMovieResult = try await webService.fetchData()
        return result.toDomainModel()
    }
}
