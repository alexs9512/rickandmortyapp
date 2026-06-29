//
//  Characters.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 22/06/26.
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
      return "❤️"
    case "dead":
      return "☠️"
    case "unknown":
      return "🤷‍♂️"
    case .none:
      return "🤯"
    default:
      return "🤨"
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
