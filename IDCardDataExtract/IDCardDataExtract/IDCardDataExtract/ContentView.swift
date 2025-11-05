import SwiftUI
import Vision
import PhotosUI

struct ContentView: View {
    @State private var extractedText: String = "No text extracted yet."
    @State private var selectedImage: UIImage? = nil
    @State private var selectedItem: PhotosPickerItem? = nil
    
    @State private var name: String = ""
    @State private var branch: String = ""
    @State private var usn: String = ""
    
    @State private var navigateToDetails = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(10)
                        .padding(.bottom, 8)
                }
                
                PhotosPicker("Select ID Card Image", selection: $selectedItem, matching: .images)
                    .buttonStyle(.borderedProminent)
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                                extractText(from: uiImage)
                            }
                        }
                    }
                
                Spacer()
                
                NavigationLink(
                    "",
                    destination: DetailsView(image: selectedImage, name: name, branch: branch, usn: usn),
                    isActive: $navigateToDetails
                )
                .hidden()
            }
            .padding()
            .navigationTitle("Upload ID Card")
        }
    }
    
    // MARK: - OCR Extraction
    func extractText(from image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                self.extractedText = "Text Recognition Failed."
                return
            }
            
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let allText = recognizedStrings.joined(separator: "\n")
            
            DispatchQueue.main.async {
                self.extractedText = allText
                self.parseIDCardText(allText)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.navigateToDetails = true
                }
            }
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            do { try handler.perform([request]) }
            catch { DispatchQueue.main.async { self.extractedText = "OCR failed." } }
        }
    }
    
    // MARK: - Improved ID Parsing
    func parseIDCardText(_ text: String) {
        // Clean and split into lines
        let cleaned = text
            .replacingOccurrences(of: "\r", with: "")
            .replacingOccurrences(of: "|", with: "")
            .replacingOccurrences(of: "–", with: "-")
            .replacingOccurrences(of: ":", with: " : ")
            .replacingOccurrences(of: "  ", with: " ")
            .uppercased()
        
        let lines = cleaned
            .components(separatedBy: CharacterSet.newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        
        self.name = ""
        self.branch = ""
        self.usn = ""
        
        // --- 1. Detect USN ---
        let usnRegex = #"\b[1-9A-Z]{1,2}[A-Z]{1,2}\d{2}[A-Z]{2,3}\d{2,4}\b"#
        for line in lines {
            if let match = line.range(of: usnRegex, options: .regularExpression) {
                self.usn = String(line[match])
                break
            }
        }
        
        // --- 2. Detect Branch ---
        let branchKeywords = [
            "CSE", "CS", "COMPUTER SCIENCE", "INFORMATION SCIENCE", "ISE",
            "ELECTRONICS", "ECE", "EEE", "MECHANICAL", "CIVIL",
            "AI", "DATA SCIENCE", "AI & DS", "AIDS", "AIML", "ARTIFICIAL INTELLIGENCE"
        ]
        
        for line in lines {
            let l = line.uppercased()
            if branchKeywords.contains(where: { l.contains($0) }) {
                self.branch = line
                break
            }
        }
        
        // --- 3. Detect Name ---
        // Candidate lines: uppercase, no digits, not containing college/keywords
        let ignoreWords = ["COLLEGE", "ENGINEERING", "AUTONOMOUS", "MANDYA", "AFFILIATED", "BRANCH", "USN", "DATE", "STUDENT", "ID"]
        let possibleNames = lines.filter { line in
            !line.contains(where: \.isNumber) &&
            !ignoreWords.contains(where: { line.contains($0) }) &&
            line.allSatisfy { $0.isLetter || $0.isWhitespace || $0 == "." } &&
            line.count > 3
        }
        
        // Heuristic: name line is the *longest* uppercase line before degree/branch
        var degreeIndex: Int? = lines.firstIndex(where: { $0.contains("B.E") || $0.contains("BTECH") || $0.contains("MTECH") })
        if degreeIndex == nil, let branchIndex = lines.firstIndex(where: { $0 == self.branch }) {
            degreeIndex = branchIndex
        }
        
        if let idx = degreeIndex, idx > 0 {
            let before = lines.prefix(idx).filter { !$0.contains("COLLEGE") && !$0.contains("ENGINEERING") }
            self.name = before.last ?? ""
        } else if let topName = possibleNames.max(by: { $0.count < $1.count }) {
            self.name = topName
        }
        
        // --- Normalize ---
        self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        self.branch = branch.trimmingCharacters(in: .whitespacesAndNewlines)
        self.usn = usn.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // --- Safety fallback ---
        if name.isEmpty, let firstName = possibleNames.first { self.name = firstName }
        if branch.isEmpty { self.branch = "—" }
        if usn.isEmpty { self.usn = "—" }

        
        print("✅ OCR Parsed — Name: \(name), Branch: \(branch), USN: \(usn)")
    }
}

#Preview {
    ContentView()
}
