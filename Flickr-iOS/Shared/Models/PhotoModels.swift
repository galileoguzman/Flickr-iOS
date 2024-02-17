//
//  PhotoModels.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import Foundation

// General response
struct PhotoSearchResponse: Decodable {
    let title: String
    let items: [Photo]
}

struct Media: Decodable {
    let m: URL
}

struct Photo: Decodable {
    let title: String
    let media: Media
    let tags: String
    let description: String
}
