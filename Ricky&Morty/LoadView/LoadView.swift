//
//  LoadView.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 21/06/26.
//

import SwiftUI

struct LoadView: View {
  // MARK: -Constants
  private let paddingValue: CGFloat = 40.0
  private let imagedLoadView: String = "imageLoadView"
  
  // MARK: - State Properties
  @State private var fraseActual: String = "Cargandoo.."
  
  // MARK: - Observed Objects
  @ObservedObject var viewModel: HomeViewModel

  // MARK: - Body
    var body: some View {
      
      ZStack {
        backgroundImage
          
      VStack {
        Spacer()
          textFraseActual
          }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
      .onAppear {
        fraseActual = viewModel.obtenerFrasesAleatorias()
      }
    }
  // MARK: - Complementary View
  var backgroundImage: some View {
    GeometryReader { geometry in
      Image(imagedLoadView)
        .ImageStyle()
        .frame(width: geometry.size.width, height: geometry.size.height)
        .clipped()
    }
    .ignoresSafeArea()
  }
  var textFraseActual: some View {
    Text(fraseActual)
      .rickTextStyle()
      .padding(paddingValue)
    }
  
}

// MARK: - Preview
#Preview {
  LoadView(viewModel: HomeViewModel())
}
