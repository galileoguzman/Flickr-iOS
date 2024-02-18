//
//  PhotoModelTests.swift
//  Flickr-iOSTests
//
//  Created by Galileo Guzman on 18/02/24.
//

import XCTest
@testable import Flickr_iOS

final class PhotoModelTests: XCTestCase {

    func testAuthorUsername() {
        // Given
        let photo = MockPhotoModel.sample

        // When
        let username = photo.authorUsername

        // Then
        XCTAssertEqual(username, "na_photographs")
    }

    func testAuthorEmail() {
        // Given
        let photo = MockPhotoModel.sample

        // When
        let email = photo.authorEmail

        // Then
        XCTAssertEqual(email, "nobody@flickr.com")
    }

    func testAuthorDisplayable() {
        // Given
        let photo = MockPhotoModel.sample

        // When
        let displayableAuthor = photo.authorDisplayable

        // Then
        XCTAssertEqual(displayableAuthor, "Photo of na_photographs")
    }

    func testPublishedAt() {
        // Given
        let photo = MockPhotoModel.sample

        // When
        let publishedAt = photo.publishedAt
        // Then
        XCTAssertEqual(publishedAt, "18 Feb 2024")
    }

}
