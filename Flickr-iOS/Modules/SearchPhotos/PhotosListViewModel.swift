//
//  PhotosListViewModel.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import Foundation

protocol PhotosListViewModelProtocol {
    // Data implementation
    var photos: [Photo] { get }
    func fetchPhotos(with tags: String)

    // TODO: Other functions for user interaction
}

final class PhotosListViewModel: ObservableObject {
    // Data exposed to the view
    @Published var photos: [Photo] = []

    // Dependency injection
    private let service: SearchPhotosNetworkingProtocol

    init(service: SearchPhotosNetworkingProtocol = SearchPhotosNetworkingService()) {
        self.service = service
    }
}

// Protocol implementation
extension PhotosListViewModel: PhotosListViewModelProtocol {
    func fetchPhotos(with tags: String) {
        service.fetchPhotos(with: tags) { [weak self] result in
            switch result {
            case .success(let fetchedPhotos):
                DispatchQueue.main.async {
                    self?.photos = fetchedPhotos
                }
            case .failure(let error):
                // TODO: update the view with an error msg
                print("Failed to fetch photos: \(error)")
            }
        }
    }
}
