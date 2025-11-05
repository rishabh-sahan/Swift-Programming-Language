//
//  ContentView.swift
//  ImageClassificationTestCatAndDog
//
//  Created by BATCH03L1 on 31/10/25.
//

import SwiftUI
import PhotosUI
import Vision

struct ContentView: View {
        @State private var selectedItem: PhotosPickerItem? = nil
        @State private var selectedImage: UIImage? = nil
        @State private var classificationLabel: String = "Select an image"
    
    var body: some View {
        VStack(spacing: 20) {
                        if let selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        }
                        Text(classificationLabel)
                            .font(.headline)
                            .padding()
                            .multilineTextAlignment(.center)
            
                        PhotosPicker(selection: $selectedItem, matching: .images) {
                            Label("Select Photo", systemImage: "photo.on.rectangle")
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self),
                                   let image = UIImage(data: data) {
                                    selectedImage = image
                                    classificationLabel = "Classifying..."
                                    classifyImage(image)
                                }
                            }
                        }
                    }
                    .padding()
        }
    func classifyImage(_ image: UIImage) {
        guard let model = try? VNCoreMLModel(for:
                                                CatsDogsClassifier().model) else {
            classificationLabel = " Failed to load model"
            return
        }
        
        guard let cgImage = image.cgImage else {
            classificationLabel = " Invalid CGImage"
            return
        }
        let ciImage = CIImage(cgImage: cgImage)
        
        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                DispatchQueue.main.async {
                    classificationLabel = "Vision request failed: \(error.localizedDescription)"
                }
                return
            }
            if let results = request.results as? [VNClassificationObservation],
               let topResult = results.first {
                DispatchQueue.main.async {
                    classificationLabel = " \(topResult.identifier.capitalized)\nConfidence: \(String(format: "%.1f", topResult.confidence * 100))%"
                }
            } else {
                DispatchQueue.main.async {
                    classificationLabel = " No classification results"
                }
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: .up, options: [:])
            do {
                try handler.perform([request])
            } catch {
                DispatchQueue.main.async {
                    classificationLabel = " Classification failed: \(error.localizedDescription)"
                    print(" Classification failed: \(error.localizedDescription)")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
