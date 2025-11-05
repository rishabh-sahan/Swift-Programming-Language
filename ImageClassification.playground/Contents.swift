import CreateML
import Foundation


let basePath = "/Users/batch03l1/Documents/Dataset"
let trainingURL = URL(fileURLWithPath: "\(basePath)/Training")
let testingURL = URL(fileURLWithPath: "\(basePath)/Testing")

do {
    print("Loading dataset..")
    let trainingData = try MLImageClassifier.DataSource.labeledDirectories(at: trainingURL)
    let testingData = try MLImageClassifier.DataSource.labeledDirectories(at: testingURL)
    
    print("Training Model...")
    let classifier = try MLImageClassifier(trainingData: trainingData)
    print("Training Complete")
    
    let evaluation = classifier.evaluation(on: testingData)
    print("Evaluation complete.")
    print("Accuracy:", 1 - evaluation.classificationError)
    
    let modelURL = URL(fileURLWithPath: "\(basePath)/CatsDogsClassifier.mlmodel")
    try classifier.write(to: modelURL)
    print("Model saved to:", modelURL.path)
    
} catch {
    print("Error during training", error)
}
