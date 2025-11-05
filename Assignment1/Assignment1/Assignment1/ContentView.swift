import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Log in")
                .fontWeight(.bold)
                .font(.largeTitle)
                .fontDesign(.serif)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Email")
                    .fontWeight(.bold)
                TextField("Enter Your Mail ID ", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .font(.headline)
                Text("Password")
                    .fontWeight(.bold)
                SecureField("Enter Your Password", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .font(.headline)
            }
            
            VStack(alignment: .trailing, spacing: 20){
                Button("Forgot Password?") {
                    print("You Ediot Stop It!!")
                }
                Button(action: {
                    print("Button Pressed!!")
                }) {
                    Text("Login")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.vertical)
                }
                Text("Don't have an account?")
                Button("Register Here!!"){
                    
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
