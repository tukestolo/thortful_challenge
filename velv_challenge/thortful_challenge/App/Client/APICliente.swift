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

