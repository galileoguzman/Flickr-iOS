//
//  MediaModelTests.swift
//  Flickr-iOSTests
//
//  Created by Galileo Guzman on 18/02/24.
//

import XCTest
@testable import Flickr_iOS

final class MediaModelTests: XCTestCase {

    func testMediaQURL() {
        // Given
        let mURL = URL(string: "https://farm1.staticflickr.com/123/4567890123_m.jpg")!
        let media = Media(m: mURL)

        // When
        let qURL = media.q

        // Then
        XCTAssertEqual(qURL.absoluteString, "https://farm1.staticflickr.com/123/4567890123_q.jpg")
    }

    func testMediaSURL() {
        // Given
        let mURL = URL(string: "https://farm1.staticflickr.com/123/4567890123_m.jpg")!
        let media = Media(m: mURL)

        // When
        let sURL = media.s

        // Then
        XCTAssertEqual(sURL.absoluteString, "https://farm1.staticflickr.com/123/4567890123_s.jpg")
    }

}
