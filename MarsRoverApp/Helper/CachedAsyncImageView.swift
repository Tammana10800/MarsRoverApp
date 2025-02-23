//
//  CachedAsyncImageView.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//


import SwiftUI

struct CachedAsyncImageView: View {
    let urlString: String
    var placeholderImage: UIImage? = UIImage(systemName: "photo")
    
    @State private var image: UIImage? = nil

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Image(uiImage: placeholderImage ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.3)
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    private func loadImage() {
        
        //local cache
        if let cachedImage = ImageCacheManager.shared.loadImage(for: urlString) {
            self.image = cachedImage
        } else {
            // Download and cache the image
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let downloadedImage = UIImage(data: data) {
                    ImageCacheManager.shared.saveImage(downloadedImage, for: urlString)
                    DispatchQueue.main.async {
                        self.image = downloadedImage
                    }
                }
            }.resume()
        }
    }
}
