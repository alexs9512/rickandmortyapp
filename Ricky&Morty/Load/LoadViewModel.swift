//
//  LoadViewModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

import Foundation
import SwiftUI
import Combine

class LoadViewModel: ObservableObject {
  @Published var phrasesInScreen: String = "Cargando... Bup!"
  private let model = LoadModel()
  
  func loadNewPhrase()  {
    self.phrasesInScreen = model.phrases.randomElement() ?? "Cargando... Bup!"
     
     
   }
}
