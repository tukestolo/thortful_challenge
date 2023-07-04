//
//  HasImageAnimatedTransitioning.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 04/07/2023.
//

import UIKit

protocol HasImageAnimatedTransitioning {
    func getImageViewForTransition() throws -> UIImageView
}
