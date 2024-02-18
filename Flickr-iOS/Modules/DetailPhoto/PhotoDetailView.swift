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
        VStack(alignment: .leading, spacing: 0) {
            GeometryReader { geometry in
                ZStack(alignment: .bottomTrailing) {
                    RemoteImage(url: photo.media.m)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 300)
                        .clipped()
                        .accessibility(label: Text("Photo by \(photo.authorUsername)"))
                        .accessibility(addTraits: .isImage)
                        .accessibilitySortPriority(1)

                    VStack(alignment: .trailing, spacing: 4) {
                        Text(photo.authorDisplayable)
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
            .frame(maxHeight: 300)

            VStack(alignment: .leading){
                Text(photo.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .accessibility(label: Text("Title: \(photo.title)"))
                    .accessibilitySortPriority(2)

                Text("Published date: \(photo.publishedAt)")
                    .font(.caption)
                    .accessibility(label: Text("Published date: \(photo.publishedAt)"))
                    .accessibility(hint: Text("This is the published date of the photo."))
                    .accessibilitySortPriority(3)

                Text("Tags: \(photo.tags)")
                    .font(.caption)
                    .accessibility(label: Text("Tags: \(photo.tags)"))
                    .accessibilitySortPriority(4)
            }
            .padding()

            HTMLTextView(
                htmlString: photo.description
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            
            Spacer()

        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    PhotoDetailView(photo: MockPhotoModel.sample)
}
