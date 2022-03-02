//
//  PhotoCollectionViewCell.swift
//  CollectionViews
//
//  Created by Tony on 01.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  static let identifier = "PhotoCollectionViewCell"
  
  private let imageView:UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()
  
  let name: UILabel = {
    let label = UILabel(frame: .zero)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.textColor = .black
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupLayouts()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 10.0
    contentView.backgroundColor = .white
    contentView.layer.borderColor = UIColor.blue.cgColor
    contentView.layer.borderWidth = 2
    contentView.addSubview(imageView)
    contentView.addSubview(name)
  }
  
  private func setupLayouts() {
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    name.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      imageView.widthAnchor.constraint(equalToConstant: 40),
      imageView.heightAnchor.constraint(equalToConstant: 20),
      imageView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor)
    ])
    
    NSLayoutConstraint.activate([
      name.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 2),
      name.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
    ])
  }
  
  func setup(with profile: Profile) {
    imageView.image = UIImage(named: profile.imageName)
    name.text = profile.name
  }
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    // imageView.image = nil
  }
  
}
