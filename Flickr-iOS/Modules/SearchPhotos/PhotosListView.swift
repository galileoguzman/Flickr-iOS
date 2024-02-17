//
//  PhotosListView.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import SwiftUI

struct PhotosListView: View {
    @State private var searchText: String = ""
    @StateObject var viewModel = PhotosListViewModel()

    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)

    var body: some View {
        VStack {
            TextField("Search Photos", text: $searchText, onCommit: {
                viewModel.fetchPhotos(with: searchText)
            })
            .padding()

            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(viewModel.photos, id: \.link) { photo in
                        PhotoItemView(photo: photo)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            viewModel.fetchPhotos(with: "coast")
        }
    }
}

#Preview {
    PhotosListView(
        viewModel: PhotosListViewModel(
            service: MockSearchPhotosNetworking()
        )
    )
}