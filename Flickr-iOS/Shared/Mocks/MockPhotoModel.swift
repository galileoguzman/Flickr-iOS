//
//  MockPhotoModel.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 18/02/24.
//

import Foundation

struct MockPhotoModel {
    static var sample: Photo {
        return Photo(
            link: "https://live.staticflickr.com/65535/53532215897/",
            title: "One whale going down.",
            media: Media(m: URL(string: "https://live.staticflickr.com/65535/53532215897_16ec08f692_m.jpg")!),
            tags: "california ca coast westcoast pacificocean pacificcoasthighway whales humpbackwhales kelpkelpbeds",
            description: "<p><a href=\"https://www.flickr.com/people/104346629@N03/\">na_photographs</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/104346629@N03/53537265749/\" title=\"Mallorca\"><img src=\"https://live.staticflickr.com/65535/53537265749_58bef62419_m.jpg\" width=\"240\" height=\"160\" alt=\"Mallorca\" /></a></p>",
            author: "nobody@flickr.com (\"na_photographs\")",
            published: "2024-02-18T16:49:57Z"
        )
    }
}
