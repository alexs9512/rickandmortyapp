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

  // MARK: - Text Extension
extension View {
  func rickTextStyle() -> some View {
    self.modifier(RickTexStyle())
  }
}
