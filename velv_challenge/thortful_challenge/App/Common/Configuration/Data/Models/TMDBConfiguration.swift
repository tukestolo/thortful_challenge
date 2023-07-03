//
//  TMDBConfiguration.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation

struct TMDBConfiguration: Codable {

    let images: TMDBImages
    let changeKeys: [String]

    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys = "change_keys"
    }
}

extension TMDBConfiguration: ToDomainModelMapping {

    func toDomainModel() -> Configuration {
        .init(
            images: images.toDomainModel()
        )
    }
}
