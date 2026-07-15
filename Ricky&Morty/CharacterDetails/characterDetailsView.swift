//
//  characterDetailsView.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 29/06/26.
//

import SwiftUI

struct characterDetailsView: View {
  
@StateObject private var detailViewModel = CharacterDetailsViewModel()
  
  // MARK: - Constants
  private let vStackSpacing: CGFloat = 20.0
  private let titleTextNamePadding: CGFloat = 10.0
  private let characterImageFrameWidth: CGFloat = 280.0
  private let characterDetailsImage: String = "imageDefault"
  
  // MARK: - llamadas.
  let character: Character
  
  // MARK: - Body
  var body: some View {
    Group {
      if detailViewModel.isTimeDone {
        
        ZStack {
            imagebackGround
      
        ScrollView {
          VStack(spacing: vStackSpacing) {
            titleTextName
          Spacer()
            
            characterImage
            
            titleTextId
            
          HStack {
              titlTextStatus
              titleTextSpecies
        }
      }
    }
  }
      } else  {
        LoadView()
          .onAppear {
            detailViewModel.startDetailsTimer()
        }
      }
    }
  }
  
  // MARK: - Complementary View
  var titleTextName: some View {
    Text("\(character.name)")
      .font(.largeTitle)
      .characterDetailsTextStyle()
      .padding(.top, titleTextNamePadding)
  }
  
  var titleTextId: some View {
    Text("ID: \n \(character.idEmoji)")
      .characterDetailsTextStyle()
  }
  
  var titlTextStatus: some View {
    Text("Status: \n \(character.statusEmoji)")
      .characterDetailsTextStyle()
  }
  
  var titleTextSpecies: some View {
    Text("Species: \n \(character.speciesEmoji)")
      .characterDetailsTextStyle()
  }
  
  var imagebackGround: some View {
    Image(characterDetailsImage)
      .ImageStyle()
  }
  
  var characterImage: some View {
    CustomAsyncImage(urlString: character.image)
      .aspectRatio(contentMode: .fit)
      .frame(width: 280, height: 280)
      .clipShape(RoundedRectangle(cornerRadius: 50))

  }
}
  
#Preview {
  characterDetailsView(character: .previewSample)
}
