//
//  TMDBImages.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

struct TMDBImages: Codable {

    let baseURL: String
    let secureBaseURL: String
    let backdropSizes: [String]
    let logoSizes: [LogoSize]
    let posterSizes: [PosterSize]
    let profileSizes: [ProfileSize]
    let stillSizes: [StillSize]

    enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
        case secureBaseURL = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
}

extension TMDBImages: ToDomainModelMapping {

    func toDomainModel() -> Images {
        .init(
            baseURL: secureBaseURL,
            posterSizes: .w500
        )
    }
}
