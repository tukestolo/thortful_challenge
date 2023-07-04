//
//  PushAnimationsFactory.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 04/07/2023.
//

import UIKit

struct PushAnimationsFactory {

    enum Error: Swift.Error {
        case noCustomTransitionDesired
    }

    func createAnimatedTransitioning(fromViewController: UIViewController, toViewController: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        do {
            if
                let fromImageAnimatedTransitioning = fromViewController as? HasImageAnimatedTransitioning,
                let toImageAnimatedTransitioning = toViewController as? HasImageAnimatedTransitioning
            {
                return ImageAnimatedTransitioning(
                    duration: 0.8,
                    fromImageView: try fromImageAnimatedTransitioning.getImageViewForTransition(),
                    toImageView: try toImageAnimatedTransitioning.getImageViewForTransition()
                )
            }
        } catch Error.noCustomTransitionDesired {
            return nil
        } catch {
            assertionFailure("Failed to find imageViews for transition. Error: \(String(describing: error))")
        }

        return nil
    }
}
