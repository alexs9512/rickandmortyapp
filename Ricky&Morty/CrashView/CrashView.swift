//
//  CrashView.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

import SwiftUI
struct CrashView: View {

// MARK: - Constasnt
private let crashImageName: String = "imageCrashView"
  
// MARK: - Body
    var body: some View {
      ZStack {
        backgroundImage
        
        VStack {
          mainTitle
          Spacer()
          
          Spacer()
          subTitle
        }
      }
    }
  
// MARK: - Complementary Views
  var backgroundImage: some View {
    Image(crashImageName)
      .ImageStyle()
  }
  
  var mainTitle: some View {
    Text(CrashViewTexts.mainTitle)
      .font(.largeTitle)
      .rickTextStyle()
  }
  
  var subTitle: some View {
    Text(CrashViewTexts.subTitle)
      .font(.largeTitle)
      .rickTextStyle()
  }
  
}

#Preview {
    CrashView()
}
