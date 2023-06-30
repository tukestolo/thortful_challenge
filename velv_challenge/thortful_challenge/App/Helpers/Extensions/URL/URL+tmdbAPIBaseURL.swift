//
//  URL+tmdbAPIBaseURL.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

extension URL {

    static var tmdbAPIBaseURL: URL {
        URL(string: "https://api.themoviedb.org/3")!
    }
}
