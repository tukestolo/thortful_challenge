//
//  MovieListCell.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation
import SnapKit
import UIKit
import AlamofireImage

class MovieListCell: UICollectionViewCell {

    private var viewModel: MovieListCellViewModel?
    private let containerView = UIView()
    private let coverImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: MovieListCellViewModel?) {

        guard
            let posterURLString = viewModel?.posterURLString,
            let url = URL(string: posterURLString)
        else { return }

        coverImageView.af.setImage(
            withURL: url,
            imageTransition:.crossDissolve(0.3)
        )
    }

    override func prepareForReuse() {
        coverImageView.image = nil
    }
}

extension MovieListCell: ConfigureView {

    func configureViewProperties() {
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.cornerRadius = 4
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        clipsToBounds = true
        coverImageView.clipsToBounds = true
        containerView.clipsToBounds = true
    }

    func configureViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(coverImageView)
    }

    func configureViewLayout() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(8)
        }

        coverImageView.snp.makeConstraints { make in
            make.equalToSuperView()
        }
    }
}
