//
//  SearchPhotosNetworkingServiceTests.swift
//  Flickr-iOSTests
//
//  Created by Galileo Guzman on 18/02/24.
//

import XCTest
@testable import Flickr_iOS

final class SearchPhotosNetworkingServiceTests: XCTestCase {

    var networkingService: SearchPhotosNetworkingService!

    override func setUp() {
        super.setUp()
        networkingService = SearchPhotosNetworkingService()
    }

    override func tearDown() {
        networkingService = nil
        super.tearDown()
    }

    func testFetchPhotos() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch photos completed")

        // When
        networkingService.fetchPhotos(with: "coast") { result in
            // Then
            switch result {
            case .success(let photos):
                XCTAssertFalse(photos.isEmpty, "Photos should not be empty")
            case .failure(let error):
                XCTFail("Fetching photos failed with error: \(error)")
            }
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled due the networking call
        wait(for: [expectation], timeout: 5.0)
    }

}
