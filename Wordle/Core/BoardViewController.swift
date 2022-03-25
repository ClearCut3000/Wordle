//
//  BoardViewController.swift
//  Wordle
//
//  Created by Николай Никитин on 22.03.2022.
//

import UIKit

class BoardViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

  //MARK: - Properties
  weak var datasource: BoardViewControllerDataSource?
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 4
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .clear
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
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
    ])
  }

  //MARK: - UIMethods
  func reloadData() {
    collectionView.reloadData()
  }
}

//MARK: - CollectionView Protocols Extension
extension BoardViewController {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return datasource?.currentGuesses.count ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let guesses = datasource?.currentGuesses ?? []
    return guesses[section].count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyCell.identifier, for: indexPath) as? KeyCell else { fatalError() }
    cell.backgroundColor = nil
    cell.layer.borderWidth = 1
    cell.layer.borderColor = UIColor.systemGray3.cgColor
    let guesses = datasource?.currentGuesses ?? []
    if let letter = guesses[indexPath.section][indexPath.row] {
      cell.configure(with: letter)
    }
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let margin: CGFloat = 20
    let size: CGFloat = (collectionView.frame.size.width-margin)/5
    return CGSize(width: size, height: size)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    <#code#>
  }
}
