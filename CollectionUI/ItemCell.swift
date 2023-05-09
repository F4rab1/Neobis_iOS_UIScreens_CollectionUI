//
//  ItemCell.swift
//  CollectionUI
//
//  Created by Фараби Иса on 10.05.2023.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let rightButtonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "rightArrow")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(label1)
        containerView.addSubview(label2)
        containerView.addSubview(image)
        containerView.addSubview(rightButtonImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 15),
            label1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            
            label2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 15),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor),
            
            image.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            image.trailingAnchor.constraint(equalTo: rightButtonImage.leadingAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            
            rightButtonImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            rightButtonImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            rightButtonImage.widthAnchor.constraint(equalToConstant: 20),
            rightButtonImage.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    func configure(with text1: String, text2: String, imageforcell: UIImage) {
        label1.text = text1
        label2.text = text2
        image.image = imageforcell
    }
}
