import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background color
            Color.green
                .ignoresSafeArea()  // Make sure background covers whole screen
            
            VStack(spacing: 30) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Get out from the APP")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
                    .fontWeight(.semibold)
                
                Button(action: {
                    print("Get Started tapped!")
                }) {
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
