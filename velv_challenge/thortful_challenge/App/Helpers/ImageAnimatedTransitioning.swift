//
//  ImageAnimatedTransitioning.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 04/07/2023.
//

import UIKit

class ImageAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    private let duration: TimeInterval
    private let imageFrameDuration: TimeInterval
    private let imageAlphaDuration: TimeInterval
    private let fromImageView: UIImageView
    private let toImageView: UIImageView

    init(duration: TimeInterval, fromImageView: UIImageView, toImageView: UIImageView) {
        self.duration = duration
        self.fromImageView = fromImageView
        self.toImageView = toImageView

        imageFrameDuration = duration * 0.8
        imageAlphaDuration = duration * 0.2
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to)
        else { return }

        let containerView = transitionContext.containerView
        let snapshotImageView = createImageViewCopy(from: fromImageView, containerView: containerView)

        containerView.addSubview(fromView)
        containerView.addSubview(toView)
        containerView.addSubview(snapshotImageView)

        animateImageViewToDestination(containerView: containerView, toView: toView, snapshotImageView: snapshotImageView) {
            self.removeSnapShotImageViewAnimated(snapshotImageView) {
                didComplete in
                transitionContext.completeTransition(didComplete)
            }
        }
    }
}

private extension ImageAnimatedTransitioning {

    func createImageViewCopy(from: UIImageView, containerView: UIView) -> UIImageView {
        let snapshotImageView = UIImageView()
        snapshotImageView.clipsToBounds = from.clipsToBounds
        snapshotImageView.contentMode = from.contentMode
        snapshotImageView.image = from.image
        snapshotImageView.layer.cornerRadius = from.layer.cornerRadius
        snapshotImageView.frame = containerView.convert(from.frame, from: from.superview)

        return snapshotImageView
    }

    func animateImageViewToDestination(
        containerView: UIView,
        toView: UIView,
        snapshotImageView: UIImageView,
        completion: @escaping () -> Void
    ) {
        toImageView.isHidden = true
        fromImageView.isHidden = true

        toView.layoutIfNeeded()
        toView.alpha = 0

        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 1
        ) {
            snapshotImageView.frame = containerView.convert(self.toImageView.frame, from: self.toImageView)
            snapshotImageView.layer.cornerRadius = self.toImageView.layer.cornerRadius
            toView.alpha = 1
        } completion: {
            _ in
            self.fromImageView.isHidden = false
            self.toImageView.isHidden = false
            completion()
        }
    }

    func removeSnapShotImageViewAnimated(
        _ snapshotImageView: UIImageView,
        completion: @escaping (Bool) -> Void
    ) {
        UIView.animate(withDuration: imageAlphaDuration, delay: 0, options: .curveEaseOut) {
            snapshotImageView.alpha = 0
        } completion: {
            didComplete in
            snapshotImageView.removeFromSuperview()
            completion(didComplete)
        }
    }
}
