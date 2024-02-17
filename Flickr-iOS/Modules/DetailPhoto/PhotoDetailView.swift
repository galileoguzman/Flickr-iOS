//
//  PhotoDetailView.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import SwiftUI

struct PhotoDetailView: View {
    let photo: Photo

    var body: some View {
        VStack {
            RemoteImage(url: photo.media.m)
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 300)
                .padding()

            Text(photo.title)
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text("Tags: \(photo.tags)")
                .font(.headline)
                .padding()

            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        
    }
}

#Preview {
    PhotoDetailView(photo: Photo(
        link: "https://live.staticflickr.com/65535/53532215897/",
        title: "One whale going down.",
        media: Media(m: URL(string: "https://live.staticflickr.com/65535/53532215897_16ec08f692_m.jpg")!),
        tags: "california ca coast westcoast pacificocean pacificcoasthighway whales humpbackwhales kelpkelpbeds",
        description: "One of the whales again descends into the kelp beds as the other cruises on the surface."
    ))
}
