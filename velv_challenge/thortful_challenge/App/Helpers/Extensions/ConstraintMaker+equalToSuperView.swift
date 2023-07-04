//
//  ConstraintMaker+equalToSuperView.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import SnapKit

extension ConstraintMaker {
    func equalToSuperView() {
        leading.trailing.top.bottom.equalToSuperview()
    }
}
