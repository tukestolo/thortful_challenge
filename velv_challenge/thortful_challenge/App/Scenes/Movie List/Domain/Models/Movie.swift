//
//  Movie.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

struct Movie {

    let id: Int
    let originalLanguage: String
    let title: String
    let originalTitle: String
    let overview: String
    let posterPath: String?
}

extension Movie {

    func buildPosterURLString() -> String? {
        guard
            let baseURL = ImagesConfiguration.shared.images?.baseURL,
            let posterSize = ImagesConfiguration.shared.images?.posterSizes.rawValue,
            let posterPath
        else { return nil }

        return "\(baseURL)\(posterSize)\(posterPath)"
    }
}
