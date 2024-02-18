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
    let author: String
}

extension Photo {
    var author_username: String {
        guard let regex = try? NSRegularExpression(pattern: "\\(\"(.+?)\"\\)", options: []),
              let match = regex.firstMatch(in: author, options: [], range: NSRange(author.startIndex..., in: author)),
              let range = Range(match.range(at: 1), in: author) else {
            return ""
        }
        return String(author[range])
    }

    var author_email: String {
        guard let range = author.range(of: #"\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"#, options: .regularExpression) else {
            return ""
        }
        return String(author[range])
    }

    var author_displayable: String {
        return "Photo of \(author_username)"
    }
}
