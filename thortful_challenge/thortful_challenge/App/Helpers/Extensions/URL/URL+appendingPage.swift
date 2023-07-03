//
//  URL+appendingPage.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

extension URL {

    func appendingPage(_ page: Int?) -> Self {
        guard var page = page else {
            return self
        }

        page = max(page, 1)
        page = min(page, 1000)

        return appendingQueryItem(name: QueryItemName.page, value: page)
    }
}
