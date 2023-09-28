//
//  Day63PractiseView.swift
//  Instafilter
//
//  Created by Po Hsiang Chao on 2023/9/19.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct Day63PractiseView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
            
            Button("Save Image") {
                saveImage()
            }
        }
        .onAppear(perform: loadImage)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { newValue in
            loadImageFromPicker()
        }
    }
    
    func loadImageFromPicker() {
        guard let inputImage = inputImage else { return }
        image = Image.init(uiImage: inputImage)
    }
    
    func loadImage() {
        // UIImage -> CIImage
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
            
            // Use CIFilter
        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()  // Create a twirl distortion filter
        currentFilter.inputImage = beginImage  // Set the input image

        let amount = 1.0  // Define the amount of adjustment

        let inputKeys = currentFilter.inputKeys  // Get supported input keys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }

        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }

        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }

            // Convert the output from filter to image
            // CIFilter -> CIImage
        guard let outputImage = currentFilter.outputImage else { return }

            // Ask context to create a CGImage from that outputImage.
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    // CGImage -> UIImage.
            let uiImage = UIImage(cgImage: cgimg)
                    // UIImage -> SwiftUI Image
            image = Image(uiImage: uiImage)
        }
    }
    
    func saveImage() {
        guard let image = inputImage else { return }
        
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: image)
    }
}

struct Day63PractiseView_Previews: PreviewProvider {
    static var previews: some View {
        Day63PractiseView()
    }
}
