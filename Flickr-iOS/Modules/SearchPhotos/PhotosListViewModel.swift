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
    var isLoading: Bool { get }
    func fetchPhotos(with tags: String)

    // TODO: Other functions for user interaction
}

final class PhotosListViewModel: ObservableObject {
    // Data exposed to the view
    @Published var photos: [Photo] = []
    @Published var isLoading: Bool = false

    // Initial fetched tag
    private let initialSearch = "porcupine"

    // Dependency injection
    private let service: SearchPhotosNetworkingProtocol

    init(service: SearchPhotosNetworkingProtocol = SearchPhotosNetworkingService()) {
        self.service = service

        fetchPhotos(with: initialSearch)
    }
}

// Protocol implementation
extension PhotosListViewModel: PhotosListViewModelProtocol {
    func fetchPhotos(with tags: String) {
        isLoading = true
        service.fetchPhotos(with: tags) { [weak self] result in
            // Make sure the isLoading property is set to false
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let fetchedPhotos):
                    self?.photos = fetchedPhotos
                case .failure(let error):
                    // TODO: update the view with an error msg
                    print("Failed to fetch photos: \(error)")
                }
            }
        }
    }
}
