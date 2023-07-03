//
//  ConfigurationWebService.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation

enum ConfigurationPath {

    case configuration
}

extension ConfigurationPath {

    private static let basePath = URL(string: "/configuration")!

    var path: URL {
        switch self {
        case .configuration:
            return Self.basePath
        }
    }
}

class ConfigurationWebService: GenericWebService {

    let client: Client = TMDbAPILiveClient()
    var path: URL?
}
