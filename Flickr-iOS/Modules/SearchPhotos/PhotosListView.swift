//
//  PhotosListView.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import SwiftUI

struct PhotosListView: View {

    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var gridItems: [GridItem] {
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            return Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
        } else {
            return Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
        }
    }

    @State private var searchText: String = ""
    @StateObject var viewModel = PhotosListViewModel()

    var body: some View {
        NavigationView {
            VStack {

                // Search text field with accessibility options
                HStack {
                    TextField("Search for Photos", text: $searchText)
                        .padding()
                        .onTapGesture {
                            searchText = ""
                        }
                        .onChange(of: searchText) {
                            if searchText.count >= 3 {
                                viewModel.fetchPhotos(with: searchText)
                            }
                        }
                        .accessibilityLabel("Search for photos")
                        .accessibilityAction(named: "Search") {
                            viewModel.fetchPhotos(with: searchText)
                        }
                        .accessibilityAddTraits(.isSearchField)
                        .accessibilityHint("Type at least 3 characters to begin searching")

                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                            .accessibilityLabel("Loading")
                            .accessibilityHint("The application is waiting for results of photos")
                    }
                }

                // Task list
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        ForEach(viewModel.photos, id: \.link) { photo in
                            NavigationLink(destination: PhotoDetailView(photo: photo)) {

                                PhotoItemView(photo: photo)
                                    .aspectRatio(contentMode: .fit)
                                    .accessibilityLabel("View photo detail")
                                    .accessibilityHint("Double tap to view details of this photo")
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
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
