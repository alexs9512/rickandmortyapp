//
//  CustomAsyncImage.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

import SwiftUI

struct CustomAsyncImage: View {
    
    let urlString: String
    
    @StateObject private var loader = ImageLoader()
    
    private let defaultImageName: String = "imageCrashView"
    
    var body: some View {
        Group {
            if let uiImage = loader.image {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image(defaultImageName)
                    .resizable()
            }
        }
        .onAppear {
            loader.loadImage(from: urlString)
        }
    }
}
