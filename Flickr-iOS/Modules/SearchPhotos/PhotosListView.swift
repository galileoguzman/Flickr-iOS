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

            HStack {
                TextField("Search Photos", text: $searchText)
                    .padding()
                    .onChange(of: searchText) {
                        if searchText.count >= 3 {
                            viewModel.fetchPhotos(with: searchText)
                        }
                    }
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
            }


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
            viewModel.fetchPhotos(with: "porcupine")
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
