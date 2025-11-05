//
//  ContentView.swift
//  VisionKitDocumentEXtract
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
                            extractText(from: selectedImage!)
                        }
                    }
                }
        }
        .padding()
    }
    func extractText(from image: UIImage) {
        guard let cgImage = image.cgImage else  { return }
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
            error == nil else {
                self.extractedText = "Text Recognition Failed."
                return
            }
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let allText = recognizedStrings.joined(separator: " ")
            self.extractedText = allText.components(separatedBy: CharacterSet.decimalDigits.inverted)
                .filter { !$0.isEmpty }
                .joined(separator: "\n")
        }
        request.recognitionLevel = .accurate
        let requests = [request]
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform(requests)
            } catch {
                self.extractedText = "Failed to perform text recognition."
            }
        }
    }
}

#Preview {
    ContentView()
}
