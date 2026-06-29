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
    
    // MARK: - Published Properties
    @Published var characters: [Character] = []
    
    // MARK: - Init
    init() {
       fetchCharacters()
    }
    
    // MARK: - API Networking
    func fetchCharacters() {
      guard let url: URL = URL(string: "https://rickandmortyapi.com/api/character") else {
            print("URL inválida") // quitar print
            return
        }
        
        
        Task {
            do {
                // 1. Descargamos los datos de forma asíncrona
              let (data, _): (Data, URLResponse) = try await URLSession.shared.data(from: url)
                
                // 2. Decodificamos el JSON de forma segura
                let decoder: JSONDecoder = JSONDecoder()
                let decodedResponse = try decoder.decode(CharactersResponse.self, from: data)
                
                self.characters = decodedResponse.results
                print("¡API Exitosa! Se cargaron \(decodedResponse.results.count) personajes.") // una imagen de rick o morty celebrando
                
            } catch {
                print("Error en la API o Decodificación: \(error)") // cambiar por el rick borracho y poner el boton de reintentar y hacer otra vez el refresh
            }
        }
    }
}
