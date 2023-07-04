//
//  MoviesWebService.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

enum MoviesPath {

    case popular(page: Int? = nil)
}

extension MoviesPath {

    private static let basePath = URL(string: "/movie")!

    var path: URL {
        switch self {
        case let .popular(page):
            return Self.basePath
                .appendingPathComponent("popular")
                .appendingPage(page)
        }
    }
}

class MoviesWebService: GenericWebService {

    let client: Client = TMDbAPILiveClient()
    var path: URL?
}
