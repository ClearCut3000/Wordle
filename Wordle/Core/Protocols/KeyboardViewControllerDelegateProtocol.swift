//
//  KeyboardViewControllerDelegateProtocol.swift
//  Wordle
//
//  Created by Николай Никитин on 25.03.2022.
//

import Foundation

protocol KeyboardViewControllerDelegate: AnyObject {
  func keyboardViewController(_ vc: KeyboardViewController, didTapKey letter: Character)
}
