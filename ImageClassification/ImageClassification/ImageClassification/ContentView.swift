//
//  ContentView.swift
//  ImageClassification
//
//  Created by BATCH03L1 on 25/10/25.
//

import SwiftUI
import VisionKit
import Vision
import PhotosUI

struct ContentView: View {
    @State private var extractedText: String = "No text extracted yet."
    @State private var selectedImage: UIImage? = nil
    @State private var selectedItem: PhotosPickerItem? = nil
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
            Text(extractedText)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            PhotosPicker("Select Photo", selection: $selectedItem, matching: .images)
                .buttonStyle(.borderedProminent)
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedImage = uiImage
                            classifyImage(uiImage)
                        }
                    }
                }
        }
        .padding()
    }
    func classifyImage(_ image: UIImage) {
        guard let cgImage  = image.cgImage else {
            extractedText = "Failed to convert UIImage to CGImage."
            return
        }
        guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
            extractedText = "Failed to load model"
            return
        }
        let request = VNCoreMLRequest(model: model) { request, erro in
            if let results = request.results as? [VNClassificationObservation],
               let topResult = results.first {
                DispatchQueue.main.sync {
                    extractedText = "Classification: \(topResult.identifier) \nConfidence: \(topResult.confidence)"
                }
            }
        }
        let handler = VNImageRequestHandler(cgImage: cgImage)
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                DispatchQueue.main.sync {
                    extractedText = "Failed to perform classification.\n\(error.localizedDescription)"
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
