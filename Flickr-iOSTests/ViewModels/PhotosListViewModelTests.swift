//
//  PhotosListViewModelTests.swift
//  Flickr-iOSTests
//
//  Created by Galileo Guzman on 18/02/24.
//

import XCTest
@testable import Flickr_iOS

final class PhotosListViewModelTests: XCTestCase {

    func testFetchPhotos_Success() {
        // Given
        let mockService = MockSearchPhotosNetworking(shouldFailL: false)
        let viewModel = PhotosListViewModel(service: mockService)

        // When
        viewModel.fetchPhotos(with: "test")

        // Then
        XCTAssertTrue(viewModel.isLoading)
        // Due the completion handler we add execute the test after 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.photos.count, 4)
            XCTAssertFalse(viewModel.isLoading)
        }
    }

    func testFetchPhotos_Failure() {
        // Given
        let mockService = MockSearchPhotosNetworking(shouldFailL: true)
        let viewModel = PhotosListViewModel(service: mockService)

        // When
        viewModel.fetchPhotos(with: "test")

        // Then
        XCTAssertTrue(viewModel.isLoading)
        // Due the completion handler we add execute the test after 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.photos.count, 0)
            XCTAssertFalse(viewModel.isLoading)
        }
    }

}
