//
//  LoginView.swift
//  Project
//
//  Created by BATCH03L1 on 09/10/25.
//
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State private var isLoggedIn = false
    @State var errorMessage: String = ""
    @State var error: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack(alignment: .leading, spacing: 15) {
                    Text("Email")
                        .fontWeight(.semibold)
                    TextField("Enter your email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    Text("Password")
                        .fontWeight(.semibold)
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                Button("Login") {
                    loginUser()
                }
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
                .font(.title3)
                NavigationLink("Don't have an account? Sign Up", destination: SignupView())
                    .font(.footnote)
                    .padding(.top)
                NavigationLink("Forgot your password?", destination: ForgotPass())
                    .font(.footnote)
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding()
            .navigationTitle("Login")
            .fullScreenCover(isPresented: $isLoggedIn) {
                HomeScreen()
            }
            .alert("Login Failed", isPresented: $showError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
        }
    }

    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.showError = true
            } else {
                self.isLoggedIn = true
            }
        }
    }
}

#Preview {
    LoginView()
}
