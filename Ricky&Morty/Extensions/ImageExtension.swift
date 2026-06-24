//
//  ImageExtension.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 22/06/26.
//

import SwiftUI
import Foundation

 // MARK: - Image parameters
extension Image {
  
  func ImageStyle() -> some View {
    self
    .resizable()
    .scaledToFill()
    .ignoresSafeArea()
    
  }
}
