//
//  HTMLTextView.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 18/02/24.
//

import SwiftUI
import Foundation

struct HTMLTextView: UIViewRepresentable {
    let htmlString: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if let attributedString = htmlString.attributedString {
            uiView.attributedText = attributedString
        }
    }
}

#Preview {
    HTMLTextView(htmlString: MockHtmlPhotoDescription.sample)
}
