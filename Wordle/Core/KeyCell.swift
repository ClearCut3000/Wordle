//
//  KeyCell.swift
//  Wordle
//
//  Created by Николай Никитин on 23.03.2022.
//

import UIKit

class KeyCell: UICollectionViewCell {

  //MARK: - Properties
  static let identifier = "KeyCell"
  let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 18, weight: .bold)
    return label
  }()

  //MARK: - Init's
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    contentView.addSubview(label)
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      label.topAnchor.constraint(equalTo: contentView.topAnchor),
      label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: - Methods
  override func prepareForReuse() {
    super.prepareForReuse()
    label.text = nil
  }

  func configure(with letter: Character) {
    label.text = String(letter).uppercased()
  }
}
