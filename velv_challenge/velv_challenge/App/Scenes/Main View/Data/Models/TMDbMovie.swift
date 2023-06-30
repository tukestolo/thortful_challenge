//
//  TMDbMovie.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

struct TMDbMovie: Decodable {

    let page: Int
    let results: [TMDbMovieResult]
}
