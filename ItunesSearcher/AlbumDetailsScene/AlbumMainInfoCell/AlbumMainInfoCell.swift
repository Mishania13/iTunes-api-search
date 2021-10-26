//
//  AlbumMainInfoCell.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 26.10.2021.
//

import UIKit

class AlbumMainInfoCell: UITableViewCell {

    private var albumImageView = UIImageView()
    private var albumTitleLabel = UILabel()
    private var artistLabel = UILabel()
    private var detailsLabel = UILabel()
    private var activityIndicator = UIActivityIndicatorView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [albumImageView, albumTitleLabel, artistLabel, detailsLabel,activityIndicator].forEach{addSubview($0)}
        viewsLayout()
        selectionStyle = .none
        activityIndicator.startAnimating()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        albumImageView.image = nil
        [albumTitleLabel, artistLabel, detailsLabel].forEach{
            $0.text = nil
        }
        activityIndicator.startAnimating()
    }

    private func viewsLayout() {
        [albumImageView, albumTitleLabel, artistLabel, detailsLabel, activityIndicator].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        let imageConstraints = [
            albumImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            albumImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: frame.width * 0.6),
            albumImageView.widthAnchor.constraint(equalToConstant: frame.width * 0.6)
        ]
        let albumTitleConstraints = [
            albumTitleLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 16),
            albumTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            albumTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            albumTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ]
        let artistConstraints = [
            artistLabel.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: 12),
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            artistLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20)
        ]
        let detailsConstraints = [
            detailsLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 12),
            detailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 14),
            detailsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ]
        let activityConstraints = [
            activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: frame.width * 0.3 + 30),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 25),
            activityIndicator.heightAnchor.constraint(equalToConstant: 25)
        ]
        [imageConstraints, albumTitleConstraints, artistConstraints, detailsConstraints, activityConstraints].forEach{NSLayoutConstraint.activate($0)}
    }

    func configureCell(title: String, artist: String, details: String, image: UIImage?) {
        if let image = image {
            setImage(image: image)
        }
        albumImageView.layer.cornerRadius = 8
        albumImageView.clipsToBounds = true

        albumTitleLabel.text = title
        albumTitleLabel.numberOfLines = 0
        albumTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        albumTitleLabel.textAlignment = .center

        artistLabel.text = artist
        artistLabel.numberOfLines = 0
        artistLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        artistLabel.textAlignment = .center

        detailsLabel.text = details
        detailsLabel.numberOfLines = 0
        detailsLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        detailsLabel.textColor = .opaqueSeparator
        detailsLabel.textAlignment = .center

        activityIndicator.hidesWhenStopped = true
    }
    
    func setImage(image: UIImage) {
        albumImageView.image = image
        activityIndicator.stopAnimating()
    }
    private func setAlbumImage(image: UIImage) {
        albumImageView.image = image
        activityIndicator.stopAnimating()
    }
}
