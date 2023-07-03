//
//  ConfigurationRepository.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation

class ConfigurationRepository: ConfigurationRepositoryProtocol {

    private var webService: GenericWebService

    init(webService: GenericWebService = ConfigurationWebService()) {
        self.webService = webService
    }

    func configuration() async throws -> Configuration {
        webService.path = ConfigurationPath.configuration.path

        let result: TMDBConfiguration = try await webService.fetchData()
        return result.toDomainModel()
    }
}
