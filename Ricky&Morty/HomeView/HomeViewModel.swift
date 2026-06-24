//
//  HomeViewModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 21/06/26.
//

import Foundation
import Combine

// MARK: - View Model
@MainActor
class HomeViewModel: ObservableObject {
  @Published var isNavigatingToNextScreen: Bool = false
  
// MARK: - Journey Actions
    func startJourney() {
    isNavigatingToNextScreen = true
  }

  func obtenerFrasesAleatorias() -> String {
    
    return phrases.randomElement() ?? "Cargando... bup!" // a constantes
    
  }
}
