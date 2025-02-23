//
//  NetworkManager.swift
//  MarsRoverApp
//
//  Created by Tammana Sharma on 23/02/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos"
    private let apiKey = "tjFhOdbCcUHn2MTQ5TeW6ttU2PIimW9fe3Wbc19k"

    func fetchRoverPhotos(sol: Int = 1000, completion: @escaping (Result<[MarsPhoto], Error>) -> Void) {
        let urlString = "\(baseURL)?sol=\(sol)&api_key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Data isn't available!", code: 0)))
                return
            }

            do {
                let response = try JSONDecoder().decode(MarsPhotosResponse.self, from: data)
                completion(.success(response.photos))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
