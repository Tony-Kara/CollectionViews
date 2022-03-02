//
//  ViewController.swift
//  CollectionViews
//
//  Created by Tony on 01.03.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  var profiles: [Profile] = []
  
  private func populateProfiles() {
    profiles = [
      Profile(name: "Tony", imageName: "NFC"),
      Profile(name: "Nurlan", imageName: "NFC"),
      Profile(name: "Jerry", imageName: "NFC")
    ]
  }
  
  private let collectionView: UICollectionView = {
    let viewLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    collectionView.backgroundColor = .white
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    populateProfiles()
    setupViews()
    setupLayouts()
  }
  
  private func setupViews() {
    view.addSubview(collectionView)
    view.backgroundColor = .white
    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  private func setupLayouts() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    // collectionView.frame = view.bounds
  }
  
  // MARK: - UICollectionViewDataSource methods
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return profiles.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
    let profile = profiles[indexPath.row]
    cell.setup(with: profile)
    return cell
  }
  
  
  // MARK: - UICollectionViewDelegateFlowLayout methods
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let label = UILabel(frame: CGRect.zero)
    label.text = profiles[indexPath.row].name
    label.sizeToFit()
    return CGSize(width: label.frame.width + 65, height: 32)

  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    UIEdgeInsets(top: 50, left: 5, bottom: 2, right: 3)
  }
  
  
  // MARK: - UICollectionViewDelegate methods
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    print(" Selected section \(indexPath.section) and row \(indexPath.row)")
  }  
}

