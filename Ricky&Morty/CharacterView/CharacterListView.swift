//
//  CharacterListView.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 22/06/26.
//

import SwiftUI

struct CharacterListView: View {
  // MARK: - Contanst
  private let spacingHStack: CGFloat = 12.0
  private let frameWidth: CGFloat = 60.0
  private let frameHeight: CGFloat = 60.0
  private let cornerRadius: CGFloat = 8.0
  private let vstackSpacing: CGFloat = 4.0
  private let listOpacity: CGFloat = 0.4
  private let imageCharacterView: Image = Image("imageCharacterListView")
  
  // MARK: - Observed Objects
  @StateObject private var viewModel = CharacterListViewModel()
  
  // MARK: - Body
  var body: some View {
    ZStack {
      backgroundImage
      
      VStack(alignment: .leading, spacing: 0.0) {
        Text(CharacterViewTexts.mainTitle)
          .font(.largeTitle)
          .foregroundColor(.portalGreen)
          .bold()
          .padding(.horizontal,20.0)
          .padding(.top, 40.0)
        
        
        List(viewModel.characters) { character in characterRow(for: character)
        }
        .scrollContentBackground(.hidden)
      }
    }
  }
  
  // MARK: - Complementary View
  var backgroundImage: some View {
    Image("imageCharacterListView")
      .ImageStyle()
      .ignoresSafeArea()
  }
  
  func characterRow(for character: Character) -> some View { // optimizar
    HStack(spacing: spacingHStack) {
      
      AsyncImage(url: URL(string: character.image)) { image in // aislar la funcion de la carga de imagenes usar combine para manejar errores, si una imagen es error dejar una imagen por default
        image.resizable()
      } placeholder: {
        ProgressView()
      }
      .frame(width: frameWidth, height: frameHeight)
      .cornerRadius(cornerRadius)
      
      VStack(alignment: .leading, spacing: vstackSpacing) {
        Text(character.name)
          .rickTextStyle()
        
        Text("\(character.species) • \(character.statusEmoji)")
          .font(.title3)
          .foregroundColor(.white)
      }
    }
    .listRowBackground(Color.black.opacity(listOpacity))
  }
  
}

// MARK: - Preview
#Preview {
  NavigationStack {
    CharacterListView()
  }
}
