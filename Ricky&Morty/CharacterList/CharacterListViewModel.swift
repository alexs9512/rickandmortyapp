//
//  CharacterListViewModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 22/06/26.
//

import Foundation
import Combine
import SwiftUI

  // MARK: - View Model
@MainActor // sirve para manejar todas las propiedades en el hilo principal
class CharacterListViewModel: ObservableObject {
  
  enum ViewState {
    case loading
    case success
    case error
  }
    
    // MARK: - Published Properties
  @Published var characters: [Character] = []
  @Published var state: ViewState = .loading
  
  private let model = CharacterModel()
    
    // MARK: - Init
    init() {
       fetchCharacters()
    }
    
    // MARK: - API Networking
    func fetchCharacters() {
      self.state = .loading
        
        Task {
            do {
              let fetchedCharacters = try await model.getCharactersFromAPI()
              self.characters = fetchedCharacters
              self.state = .success
              
            } catch {
              self.state = .error
              print(error)
            }
        }
    }
}
