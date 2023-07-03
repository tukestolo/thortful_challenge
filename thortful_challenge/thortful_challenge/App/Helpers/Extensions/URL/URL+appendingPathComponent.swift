//
//  URL+appendingPathComponent.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

extension URL {

    func appendingPathComponent(_ value: Int) -> Self {
        appendingPathComponent(String(value))
    }
}
