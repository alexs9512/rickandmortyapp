//
//  CharacterListModel.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

import Foundation

// MARK: - API Response
struct CharactersResponse: Codable, Sendable {
  let results: [Character]
}

// MARK: - Character Model
struct Character: Codable, Identifiable, Sendable {
  let id: Int
  let name: String
  let status: String?
  let species: String
  let image: String
  
  var statusEmoji: String {
    switch status?.lowercased() {
      case "alive":
      return "Alive:  ❤️"
    case "dead":
      return "Dead:   ☠️"
    case "unknown":
      return "Unknown:  🤷‍♂️"
    case .none:
      return "🤯"
    default:
      return "🤨"
      }
    }
  
  var idEmoji: String {
    return "🧬   \(id) "
    }
  
  var speciesEmoji: String {
    switch species.lowercased() {
      case "human":
      return " Human:  👫🏻"
    case "alien":
      return "Alien:  👾"
    default:
      return "Other Species: 🤖"
    }
  }
}

extension Character {
  static let previewSample =  Character (
    id: 1,
    name: "Rick Sanchez",
    status: "Alive",
    species: "Human",
    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
  )
}

struct CharacterModel {
  
  func getCharactersFromAPI() async throws -> [Character] {
    guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
      throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let decodedResponse = try decoder.decode(CharactersResponse.self, from: data)
    
    return decodedResponse.results
  }
}
