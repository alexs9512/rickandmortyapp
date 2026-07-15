//
//  HomeViewModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 21/06/26.
//

import Foundation
import Combine
import Network

// MARK: - View Model

@MainActor
class HomeViewModel: ObservableObject {
  
@Published var isNavigatingToNextScreen: Bool = false
@Published var currentStatus: stateScreen = .start
  private lazy var model = HomeModel(viewModel: self)
  
  enum stateScreen {
    case start
    case charging
    case list
    case error
  }
  
  // MARK: - Journey Actions
  func startJourney() {
    isNavigatingToNextScreen = true
    
    model.startFlow()
  }
}

