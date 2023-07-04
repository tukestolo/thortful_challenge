//
//  UIView+addOptionalSubview.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import UIKit

extension UIView {

    func addOptionalSubview(_ subview: UIView?) {
        guard let subview = subview else { return }
        addSubview(subview)
    }
}
