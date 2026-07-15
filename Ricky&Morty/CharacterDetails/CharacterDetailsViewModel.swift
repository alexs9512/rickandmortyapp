//
//  CharacterDetailsViewModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//
import SwiftUI
import Combine

class CharacterDetailsViewModel: ObservableObject {
  @Published var isTimeDone: Bool = false
  
  private let model = CharacterDetailsModel()
  
  func startDetailsTimer() {
    model.executeDelay {
      self.isTimeDone = true
    
    }
  }
}
