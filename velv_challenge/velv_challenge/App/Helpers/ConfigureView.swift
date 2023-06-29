//
//  ConfigureView.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 29/06/2023.
//

// I use this protocol to clearly separate the code into view controller.
public protocol ConfigureView {

    func configureViews()
    func configureViewProperties()
    func configureViewEvents()
    func configureViewHierarchy()
    func configureViewLayout()
}

public extension ConfigureView {

    func configureViews() {
        configureViewProperties()
        configureViewEvents()
        configureViewHierarchy()
        configureViewLayout()
    }

    func configureViewProperties() {}
    func configureViewEvents() {}
    func configureViewHierarchy() {}
    func configureViewLayout() {}
}
