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
            GeometryReader { geometry in
                ZStack(alignment: .bottomTrailing) {
                    RemoteImage(url: photo.media.m)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 300)
                        .clipped()

                    VStack(alignment: .trailing, spacing: 4) {
                        Text(photo.author_displayable)
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(8)
                            .padding(8)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }

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
    PhotoDetailView(photo: MockPhotoModel.sample)
}
