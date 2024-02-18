//
//  MockSearchPhotosNetworking.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import Foundation

class MockSearchPhotosNetworking {
    private var photos: [Photo] = []

    init() {
        photos = [
            Photo(
                link: "https://live.staticflickr.com/65535/53533484753/",
                title: "High and Mighty: Durlston Head Viewpoint",
                media: Media(m: URL(string: "https://live.staticflickr.com/65535/53533484753_4ee0b7e86f_m.jpg")!),
                tags: "durlstonhead swanage dorset england cliffs oceanview viewpoint lighthouse coast scenery",
                description: "Found this incredible spot at Durlston Head with sweeping views of the coastline. The cliffs plunge down to the turquoise water, and the sky is a clear blue. Such a beautiful and peaceful place.",
                author: "nobody@flickr.com (\"na_photographs\")",
                published: "2024-02-18T16:49:57Z"
            ),
            Photo(
                link: "https://live.staticflickr.com/65535/53532959576/",
                title: "Almond blossom trip",
                media: Media(m: URL(string: "https://live.staticflickr.com/65535/53532959576_594915640e_m.jpg")!),
                tags: "andalucia spain fincadelnino benajarafe sunrise beach coast",
                description: "",
                author: "nobody@flickr.com (\"na_photographs\")",
                published: "2024-02-18T16:49:57Z"
            ),
            Photo(
                link: "https://live.staticflickr.com/65535/53533514329",
                title: "A seaside jolly",
                media: Media(m: URL(string: "https://live.staticflickr.com/65535/53533514329_6df4bdcd3c_m.jpg")!),
                tags: "michaelmarsh seaside dungeness cinematic coast coastal beach hasselblad kent landscape photographer photography stocksphotography",
                description: "down to Dungeness, Kent",
                author: "nobody@flickr.com (\"na_photographs\")",
                published: "2024-02-18T16:49:57Z"
            ),
            Photo(
                link: "https://live.staticflickr.com/65535/53532215897/",
                title: "One whale going down.",
                media: Media(m: URL(string: "https://live.staticflickr.com/65535/53532215897_16ec08f692_m.jpg")!),
                tags: "california ca coast westcoast pacificocean pacificcoasthighway whales humpbackwhales kelpkelpbeds",
                description: "One of the whales again descends into the kelp beds as the other cruises on the surface.",
                author: "nobody@flickr.com (\"na_photographs\")",
                published: "2024-02-18T16:49:57Z"
            )
        ]
    }
}

extension MockSearchPhotosNetworking: SearchPhotosNetworkingProtocol {
    func fetchPhotos(with tags: String, completion: @escaping (Result<[Photo], Error>) -> Void) {
        // Mock success response
        completion(.success(photos))
    }
}
