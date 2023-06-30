//
//  ToDomainModelMapping.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 30/06/2023.
//

protocol ToDomainModelMapping {

    associatedtype DomainModel
    func toDomainModel() throws -> DomainModel
}
