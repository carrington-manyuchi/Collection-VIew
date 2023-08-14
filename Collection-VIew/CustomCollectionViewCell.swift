//
//  CustomCollectionViewCell.swift
//  Collection-VIew
//
//  Created by DA MAC M1 157 on 2023/08/11.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "questionmark")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    public func configure(with image: UIImage) {
        myImageView.image = image
        setupUI()
    }
    
    
    private func setupUI() {
        self.addSubview(myImageView)
        self.backgroundColor = .systemRed
        
        configureConstraints()
    }

    private func configureConstraints() {
        let composemyImageView = [
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ]
        NSLayoutConstraint.activate(composemyImageView)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }
}
