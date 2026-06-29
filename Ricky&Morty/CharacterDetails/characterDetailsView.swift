//
//  characterDetailsView.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 29/06/26.
//

import SwiftUI

struct characterDetailsView: View {
  
  // MARK: - Constants
  private let imageCharacterDetails: String = "imageCharacterDetailsView"
 // MARK: - llamadas.
  let character: Character
  
 // MARK: - Body
    var body: some View {
      ZStack {
        backgroundImage
        VStack(spacing: 20) {
          AsyncImage(url: URL(string: character.image)) { phase in
            if let image = phase.image {
              image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
              Spacer()
            } else {
              ProgressView()
            }
          }
          Text(character.name)
            .font(.title)
            .foregroundColor(.portalGreen)
            
          Text("Estado: \(character.status)")
            .foregroundColor(.portalGreen)
          Text("Especie: \(character.species)")
            .foregroundColor(.portalGreen)
        }
      }
    }
  
// MARK: - Complementary View
  var backgroundImage: some View {
    Image(imageCharacterDetails)
      .ImageStyle()
    }
}

#Preview {
  characterDetailsView(character: .previewSample)
}
