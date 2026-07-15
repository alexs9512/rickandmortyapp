//
//  HomeView.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 21/06/26.
//
import Foundation
import SwiftUI

struct HomeView: View {
    
    // MARK: - ViewModel
    @StateObject private var viewModel = HomeViewModel()
    
    // MARK: - Constants
    private let imageXoffSet: CGFloat  =   -30.0
    private let vStackSpacing: CGFloat =   10.0
    private let frameHeight: CGFloat   =   500.0
    private let homeImageName: String  =   "imageHomeView"
    
    // MARK: - Body
    var body: some View {
      ZStack {
        mainView
        showCorrespondingView()
      }
    }
  
    // MARK: - Complementary View
    @ViewBuilder
    var mainView: some View {
      ZStack {
        backgroundImage
        
        VStack(spacing: vStackSpacing) {
          mainTitleText
          subTitleText
          
          Spacer()
            .frame(height: frameHeight)
          startButton
          Spacer()
          secondaryTitleText
        }
      }
    }
    
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
        viewModel.startJourney()
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
    
    // MARK: - Functions
    @ViewBuilder
    func showCorrespondingView() -> some View {
      switch viewModel.currentStatus {
        
      case .start:
        mainView
      case .charging:
        LoadView()
      case .list:
        CharacterListView()
      case .error:
        CrashView()
      }
    }
  }
  // MARK: - Preview
  #Preview {
    HomeView()
  }

