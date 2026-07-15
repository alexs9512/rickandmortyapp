//
//  CharacterDetailsModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

import Foundation

struct CharacterDetailsModel {
  func executeDelay(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
    completion()
    }
  }
}
