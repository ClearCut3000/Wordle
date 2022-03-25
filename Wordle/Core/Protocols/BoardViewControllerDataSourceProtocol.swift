//
//  BoardViewControllerDataSourceProtocol.swift
//  Wordle
//
//  Created by Николай Никитин on 25.03.2022.
//

import Foundation
import UIKit

protocol BoardViewControllerDataSource: AnyObject {
  var currentGuesses: [[Character?]] { get }
  func boxColor(at indexPath: IndexPath) -> UIColor?
}
