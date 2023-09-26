//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Po Hsiang Chao on 2023/9/26.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        // Configuration code here
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // Update code here
    }
}
