//
//  String+Extension.swift
//  Flickr-iOS
//
//  Created by Galileo Guzman on 18/02/24.
//

import Foundation

extension String {
    var attributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return nil
        }
    }
}
