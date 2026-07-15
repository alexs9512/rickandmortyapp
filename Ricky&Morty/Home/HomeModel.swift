//
//  HomeModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

import Foundation
import Network

class HomeModel {
  private let viewModel: HomeViewModel
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
  }
  
  
  func startFlow() {
      self.viewModel.currentStatus = .charging
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        self.viewModel.currentStatus = .list
    }
  }
}
