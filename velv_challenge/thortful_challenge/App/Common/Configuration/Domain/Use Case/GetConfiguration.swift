//
//  GetConfiguration.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation

struct GetConfiguration {

    private let repository: ConfigurationRepositoryProtocol

    init(repository: ConfigurationRepositoryProtocol = ConfigurationRepository()) {
        self.repository = repository
    }

    func execute() async throws -> Configuration {
        try await repository.configuration()
    }
}
