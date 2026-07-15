//
//  ImageLoader.swift
//  Ricky&Morty
//
//  Created by Alexis Jose Palma Ortiz on 03/07/26.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
  @Published var image: UIImage? = nil
  
  private var cancellable: AnyCancellable?
  
  func loadImage(from urlString: String) {
    guard let url: URL = URL(string: urlString) else { return }
    
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] downloadedImage in
        self?.image = downloadedImage
      }
  }
  deinit {
    cancellable?.cancel()
  }
}
