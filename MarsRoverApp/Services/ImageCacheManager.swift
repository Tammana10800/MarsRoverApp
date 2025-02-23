//
//  ImageCacheManager.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import UIKit

class ImageCacheManager {
    static let shared = ImageCacheManager()

    private init() {}

    private func getImagePath(for urlString: String) -> URL? {
        guard let fileName = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return nil
        }
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths.first?.appendingPathComponent(fileName)
    }

    func saveImage(_ image: UIImage, for urlString: String) {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let fileURL = getImagePath(for: urlString) else { return }
        try? data.write(to: fileURL)
    }

    func loadImage(for urlString: String) -> UIImage? {
        guard let fileURL = getImagePath(for: urlString),
              FileManager.default.fileExists(atPath: fileURL.path) else { return nil }
        return UIImage(contentsOfFile: fileURL.path)
    }
}
