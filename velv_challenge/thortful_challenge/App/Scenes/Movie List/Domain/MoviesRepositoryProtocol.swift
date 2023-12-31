//
//  MoviesRepositoryProtocol.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

import Foundation

protocol MoviesRepositoryProtocol {

    func popular(page: Int) async throws -> MovieResult
}
