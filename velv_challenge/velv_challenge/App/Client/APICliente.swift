//
//  APICliente.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

protocol Client {

    var apiKey: String { get }
    var baseURL: URL { get }

    func buildURLRequest(for path: URL?) -> URLRequest?
}

struct TMDbAPILiveClient: Client {

    let apiKey = "0ac5b3104b3c7c24ff4635a2dbc64b79"
    let baseURL: URL = .tmdbAPIBaseURL

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
            var path,
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
