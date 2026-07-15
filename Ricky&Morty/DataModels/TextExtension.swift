//
//  TextExtension.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 22/06/26.
//

import SwiftUI
import Foundation
// MARK: - Text Modifiers

struct RickTexStyle: ViewModifier {
    func body(content: Content) -> some View {
    content
        .fontWeight(.bold)
        .foregroundColor(.portalGreen)
        .multilineTextAlignment(.center)
  }
}
extension View {
  func rickTextStyle() -> some View {
    self.modifier(RickTexStyle())
  }
}

// MARK: - Text Modifiers CharacterDetailsView

struct characterDetailsViewTextStyle: ViewModifier{
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .foregroundColor(.portalGreen)
      .frame(maxWidth: .infinity)
      .padding(.vertical,10)
      .background(Color.white.opacity(0.1))
      .cornerRadius(10)
  }
}

extension View {
  func characterDetailsTextStyle() -> some View {
    self.modifier(characterDetailsViewTextStyle())
  }
}
