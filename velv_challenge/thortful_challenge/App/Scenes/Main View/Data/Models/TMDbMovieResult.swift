//
//  TMDbMovie.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

struct TMDbMovieResult: Decodable {

    let page: Int
    let results: [TMDbMovie]
}

extension TMDbMovieResult: ToDomainModelMapping {

    func toDomainModel() -> MovieResult {
        .init(
            page: page,
            movies: results.map { $0.toDomainModel() }
        )
    }
}
