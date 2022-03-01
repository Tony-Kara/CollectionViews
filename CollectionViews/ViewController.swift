//
//  ViewController.swift
//  CollectionViews
//
//  Created by User on 01.03.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  
  
  private let collectionView: UICollectionView = {
      let viewLayout = UICollectionViewFlowLayout()
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    //  collectionView.backgroundColor = .white
      return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
  
 // MARK: - UICollectionViewDataSource methods
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath)
    return cell
  }
  
  
  // MARK: - UICollectionViewDelegateFlowLayout methods
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(
      width: (view.frame.size.width/3)-3,
    height: (view.frame.size.width/3)-3
    )
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
  }
  
  
  // MARK: - UICollectionViewDelegate methods
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    print(" Selected section \(indexPath.section) and row \(indexPath.row)")
  }

}

