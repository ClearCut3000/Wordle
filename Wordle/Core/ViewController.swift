//
//  ViewController.swift
//  Wordle
//
//  Created by Николай Никитин on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  let keyboardVC = KeyboardViewController()
  let boardVC = BoardViewController()
  private var guesses: [[Character?]] = Array(repeating: Array(repeating: nil, count: 5), count: 6)

  //MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray6
    addChildren()
  }

  //MARK: - Methods
  private func addChildren() {
    addChild(keyboardVC)
    keyboardVC.didMove(toParent: self)
    keyboardVC.delegate = self
    boardVC.datasource = self
    keyboardVC.view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(keyboardVC.view)
    addChild(boardVC)
    boardVC.didMove(toParent: self)
    boardVC.view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(boardVC.view)
    addConstrains()
  }

  func addConstrains() {
    NSLayoutConstraint.activate([
      boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      boardVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      boardVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor),
      boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
      keyboardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      keyboardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      keyboardVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

//MARK: - KeyboardViewControllerDelegate, BoardViewControllerDataSource extensions
extension ViewController: KeyboardViewControllerDelegate {
  func keyboardViewController(_ vc: KeyboardViewController, didTapKey letter: Character) {
    var stop = false
    for i in 0..<guesses.count {
      for j in 0..<guesses[i].count {
        if guesses[i][j] == nil {
          guesses[i][j] = letter
          stop = true
          break
        }
      }
      if stop { break }
    }
    boardVC.reloadData()
  }
}

extension ViewController: BoardViewControllerDataSource {
  var currentGuesses: [[Character?]] {
    return guesses
  }
}
