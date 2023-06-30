//
//  DataFetcher.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

import Foundation

class DataFetcher {

    func fetchData<T: Decodable>(from request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)

        if
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode != 200 {
            throw NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil)
        }

        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)

        return result
    }
}
