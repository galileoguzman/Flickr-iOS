//
//  PhotoItemView.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import SwiftUI

struct PhotoItemView: View {
    let photo: Photo

    var body: some View {
        VStack(alignment: .leading) {
            RemoteImage(url: photo.media.s)
                .aspectRatio(contentMode: .fill)
        }
        .padding()
    }
}
