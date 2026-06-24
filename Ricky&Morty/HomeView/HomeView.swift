//
//  HomeView.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 21/06/26.
//

import SwiftUI

struct HomeView: View {
  
  // MARK: - Constants
  private let imageXoffSet: CGFloat = -30.0
  private let vStackSpacing: CGFloat = 10.0
  private let frameHeight: CGFloat = 500.0
  private let homeImageName: String = "imageHomeView"
  
  // MARK: - Body
  var body: some View {
    
    ZStack {
      backgroundImage
      
      VStack(spacing: vStackSpacing) {
        mainTitleText
        subTitleText
        Spacer()
        
        // creacion del boton
        Spacer()
          .frame(height: frameHeight)
        startButton
        
        // segundo titutlo
        Spacer()
        secondaryTitleText
      }
    }
  }
  // MARK: - Complementary View
  var backgroundImage: some View {
    Image(homeImageName)
      .ImageStyle()
      .offset(x: imageXoffSet,
              y: .zero)
    }
  
  var mainTitleText: some View {
    Text(HomeViewTexts.mainTitle)
      .rickTextStyle()
      .font(.largeTitle)
  }
  
  var subTitleText: some View {
    Text(HomeViewTexts.subTitle)
      .rickTextStyle()
      .font(.title3)
  }
  
  var startButton: some View {
    Button(action: {
      //accion para la proxima vista
    }) {
      
      Text(HomeViewTexts.buttonTitle)
        .font(.system(.body, design: .monospaced))
        .fontWeight(.bold)
    }
    .buttonStyle(.borderedProminent)
    .controlSize(.large)
    .tint(.portalGreen)
    .foregroundColor(.black)
    .padding()
  }
  
  var secondaryTitleText: some View {
    Text(HomeViewTexts.secondaryTitle)
      .rickTextStyle()
      .font(.caption)
  }
  
  
}
// MARK: - Preview
#Preview {
    HomeView()
}
