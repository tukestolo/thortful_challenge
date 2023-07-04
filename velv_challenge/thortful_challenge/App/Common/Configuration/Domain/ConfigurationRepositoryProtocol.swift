//
//  ConfigurationRepositoryProtocol.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation

protocol ConfigurationRepositoryProtocol {

    func configuration() async throws -> Configuration
}
