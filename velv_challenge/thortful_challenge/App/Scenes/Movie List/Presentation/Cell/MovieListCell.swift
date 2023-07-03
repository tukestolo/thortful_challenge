//
//  MovieListCell.swift
//  thortful_challenge
//
//  Created by Pedro Oliveira on 03/07/2023.
//

import Foundation
import SnapKit
import UIKit

class MovieListCell: UICollectionViewCell {

    private var viewModel: MovieListCellViewModel?
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let coverImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: MovieListCellViewModel?) {
        titleLabel.text = viewModel?.title

        guard
            let posterPath = viewModel?.posterPath,
            let url = URL(string: posterPath)
        else { return }

        coverImageView.downloaded(from: url)
    }

    override func prepareForReuse() {
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

        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 2
    }

    func configureViewHierarchy() {
        addSubview(containerView)
        addSubview(coverImageView)
        addSubview(titleLabel)
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

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(UIScreen.main.bounds.width / 3)
        }
    }
}
