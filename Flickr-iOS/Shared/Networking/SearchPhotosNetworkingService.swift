//
//  SearchPhotosNetworkingService.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import Foundation

protocol SearchPhotosNetworkingProtocol {
    func fetchPhotos(with tags: String, completion: @escaping (Result<[Photo], Error>) -> Void)
}

class SearchPhotosNetworkingService: SearchPhotosNetworkingProtocol {
    let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne"

    func fetchPhotos(with tags: String, completion: @escaping (Result<[Photo], Error>) -> Void) {
        guard var urlComponents = URLComponents(string: baseURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
            URLQueryItem(name: "tags", value: tags)
        ]

        guard let url = urlComponents.url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let response = try JSONDecoder().decode(PhotoSearchResponse.self, from: data)
                completion(.success(response.items))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case invalidResponse
}
