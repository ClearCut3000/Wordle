//
//  KeyboardViewController.swift
//  Wordle
//
//  Created by Николай Никитин on 22.03.2022.
//

import UIKit

class KeyboardViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

  //MARK: - Properties
  let letters = ["qwertyuiop", "asdfghjkl", "zxcvbnm"]
  private var keys: [[Character]] = []
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 2
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .yellow
    collectionView.register(KeyCell.self, forCellWithReuseIdentifier: KeyCell.identifier)
    return collectionView
  }()

  //MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor)
    ])
  }



}
