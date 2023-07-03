//
//  TMDbAPILiveClient.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation

struct TMDbAPILiveClient: Client {

    let apiKey = "0ac5b3104b3c7c24ff4635a2dbc64b79"
    let baseURL: URL = .tmdbAPILiveBaseURL

    func buildURLRequest(for path: URL?) -> URLRequest? {
        guard let url = urlFromPath(path) else { return nil }

        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
}

extension TMDbAPILiveClient {

    func urlFromPath(_ path: URL?) -> URL? {
        guard
            let path,
            var urlComponents = URLComponents(url: path, resolvingAgainstBaseURL: true)
        else {
            return path
        }

        urlComponents.scheme = baseURL.scheme
        urlComponents.host = baseURL.host
        urlComponents.path = "\(baseURL.path)\(urlComponents.path)"

        guard let url = urlComponents.url else { return nil }

        return url
            .appendingAPIKey(apiKey)
            .appendingLanguage()
    }
}
