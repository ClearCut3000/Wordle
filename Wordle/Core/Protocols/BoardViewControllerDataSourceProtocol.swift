//
//  BoardViewControllerDataSourceProtocol.swift
//  Wordle
//
//  Created by Николай Никитин on 25.03.2022.
//

import Foundation

protocol BoardViewControllerDataSource: AnyObject {
  var currentGuesses: [[Character?]] { get }
}
