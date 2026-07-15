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
  private let paddingHorizontal: CGFloat = 20.0
  private let paddingTop: CGFloat = 40.0
  private let imageCharacterView: Image = Image("imageCharacterListView")
  
  // MARK: - Observed Objects
  @StateObject private var viewModel = CharacterListViewModel()
  
  // MARK: - Body
  var body: some View {
    NavigationStack {
      ZStack {
        backgroundImage
        
        VStack(alignment: .leading) {
          characterTextTitle
          
          List(viewModel.characters) { character in characterRow(for: character)
              .background(
            NavigationLink(destination: Ricky_Morty.characterDetailsView(character: character)) {
              EmptyView()
            }
              .opacity(.zero)
            )
          }
          .scrollContentBackground(.hidden)
        }
      }
    }
    .onAppear {
      viewModel.fetchCharacters()
    }
  }
  
  // MARK: - Complementary View
  
  var backgroundImage: some View {
    Image("imageCharacterListView")
      .ImageStyle()
      .ignoresSafeArea()
  }
  
  func characterRow(for character: Character) -> some View {
    HStack(spacing: spacingHStack) {
      
      CustomAsyncImage(urlString: character.image)
      .frame(width: frameWidth, height: frameHeight)
      .cornerRadius(cornerRadius)
      
      VStack(alignment: .leading, spacing: vstackSpacing) {
        Text(character.name)
          .rickTextStyle()
        
          .font(.title3)
          .foregroundColor(.white)
      }
    }
    .listRowBackground(Color.black.opacity(listOpacity))
  }
  
  var characterTextTitle: some View {
    Text(CharacterViewTexts.mainTitle)
      .font(.largeTitle)
      .foregroundColor(.portalGreen)
      .bold()
      .padding(.horizontal, paddingHorizontal)
      .padding(.top, paddingTop)
  }
  
}

// MARK: - Preview
#Preview {
  NavigationStack {
    CharacterListView()
  }
}
