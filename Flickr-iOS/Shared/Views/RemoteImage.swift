//
//  RemoteImage.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 17/02/24.
//

import SwiftUI

struct RemoteImage: View {
    @State private var imageData: Data?
    let url: URL

    init(url: URL) {
        self.url = url
    }

    var body: some View {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .transition(.opacity)
        } else {
            Rectangle()
                .foregroundColor(.gray)
                .onAppear {
                    loadImage(from: url)
                }
        }
    }

    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            DispatchQueue.main.async {
                withAnimation {
                    self.imageData = data
                }
            }
        }.resume()
    }
}
