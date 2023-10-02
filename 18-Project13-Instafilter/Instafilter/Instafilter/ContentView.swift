//
//  ContentView.swift
//  Instafilter
//
//  Created by Po Hsiang Chao on 2023/9/17.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    private let context = CIContext()
    @State private var currentFilter: CIFilter = CIFilter.vibrance()
    
    @State private var filterIntensity = 0.5
    @State private var filterScale = 5.0
    @State private var filterRadius = 1.0
    @State private var filterAmount = 0.0
    
    @State private var showingFilterSheet = false
    @State private var showingImageSaveAlert = false
    
    var disableSaveButton: Bool {
        processedImage == nil
    }
    
    var filterVisible: Bool {
        image != nil
    }
    
    var intensityVisible: Bool {
        currentFilter.inputKeys.contains(kCIInputIntensityKey)
    }
    
    var radiusVisible: Bool {
        currentFilter.inputKeys.contains(kCIInputRadiusKey)
    }
    
    var scaleVisible: Bool {
        currentFilter.inputKeys.contains(kCIInputScaleKey)
    }
    
    var amountVisible: Bool {
        currentFilter.inputKeys.contains(kCIInputAmountKey)
    }

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    Text("Tap to select a picture")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: 350)
                .onTapGesture {
                    // Add code to select an image
                    showingImagePicker = true
                }
                
                if filterVisible {
                    VStack {
                        Text(currentFilter.name)
                            .font(.title)
                            .padding()
                        
                        if intensityVisible {
                            HStack {
                                Text("Intensity")
                                    .frame(width: 65)
                                
                                Slider(value: $filterIntensity)
                                    .onChange(of: filterIntensity) { _ in
                                        applyProcessing()
                                    }
                            }
                        }
                        
                        if radiusVisible {
                            HStack {
                                Text("Radius")
                                    .frame(width: 65)
                                
                                Slider(value: $filterRadius, in: 1.0...200.0)
                                    .onChange(of: filterRadius) { _ in
                                        applyProcessing()
                                    }
                            }
                        }
                        
                        if scaleVisible {
                            HStack {
                                Text("Scale")
                                    .frame(width: 65)
                                
                                Slider(value: $filterScale, in: 0.0...10.0)
                                    .onChange(of: filterScale) { _ in
                                        applyProcessing()
                                    }
                            }
                        }
                        
                        if amountVisible {
                            HStack {
                                Text("Amount")
                                    .frame(width: 65)
                                
                                Slider(value: $filterAmount, in: -1.0...1.0)
                                    .onChange(of: filterAmount) { _ in
                                        applyProcessing()
                                    }
                            }
                            
                        }
                    }
                    .padding(.vertical)
                    
                }
                Spacer()
                
                HStack {
                    Button("Change filter") {
                        showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save)
                        .alert("Save Image", isPresented: $showingImageSaveAlert) {
                            Button("OK") {}
                        } message: {
                            Text("Save Sucess!")
                        }
                }
                .disabled(disableSaveButton)
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) { newValue in
                loadImage()
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Group {
                    Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                    Button("Vignette") { setFilter(CIFilter.vignette()) }
                }
                
                Button("Vibrance", role: .destructive) { setFilter(CIFilter.vibrance()) }
                Button("Pointillize", role: .destructive) { setFilter(CIFilter.pointillize()) }
                Button("Box Blur", role: .destructive) { setFilter(CIFilter.boxBlur()) }
                
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            showingImageSaveAlert = true
        }
        
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale, forKey: kCIInputScaleKey)
        }
        
        if inputKeys.contains(kCIInputAmountKey) {
            currentFilter.setValue(filterAmount, forKey: kCIInputAmountKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
