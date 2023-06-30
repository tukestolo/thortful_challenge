//
//  URL+appendingLanguage.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

import Foundation

extension URL {

    func appendingLanguage(locale: Locale = .current) -> Self {
        guard let languageCode = locale.language.languageCode?.identifier else {
            return self
        }

        return appendingQueryItem(name: QueryItemName.language, value: languageCode)
    }
}
