//
//  GenericWebService.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

import Foundation

protocol GenericWebService {

    var client: Client { get }
    var path: URL? { get set }

    func fetchData<T: Decodable>() async throws -> T
}

extension GenericWebService {

    var urlRequest: URLRequest? {

        client.buildURLRequest(for: path)
    }

    func fetchData<T: Decodable>() async throws -> T {
        let dataFetcher = DataFetcher()
        guard let urlRequest else { throw WebServiceErrors.attachmentInvalidURL }

        return try await dataFetcher.fetchData(from: urlRequest)
    }
}
