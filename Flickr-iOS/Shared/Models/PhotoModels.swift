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

/// There are different versions of the thumbnail for each image
/// https://www.flickr.com/services/api/misc.urls.html
/// this struct implements a computed property to transform the m url to a q url replacing only the desired size
struct Media: Decodable {
    let m: URL

    /// Size 150X150 cropped square
    var q: URL {
        let url = m.absoluteString.replacingOccurrences(of: "m.jpg", with: "q.jpg")
        return URL(string: url)!
    }

    /// Size 75x75 cropped square
    var s: URL {
        let url = m.absoluteString.replacingOccurrences(of: "m.jpg", with: "s.jpg")
        return URL(string: url)!
    }
}

struct Photo: Decodable {
    let link: String
    let title: String
    let media: Media
    let tags: String
    let description: String
}
