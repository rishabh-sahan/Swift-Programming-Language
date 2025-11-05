//
//  Signup.swift
//  Project
//
//  Created by BATCH03L1 on 09/10/25.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State var error: Bool = false
    @State var errorMessage: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Text("Sign Up")
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
                    SecureField("Enter a password", text: $password)
                        .textFieldStyle(.roundedBorder)
                    Text("Confirm Password")
                        .fontWeight(.semibold)
                    SecureField("Confirm password", text: $confirmPassword)
                        .textFieldStyle(.roundedBorder)
                }
                Button("Create Account") {
                    if password == confirmPassword {
                        Auth.auth().createUser(withEmail: email, password: password) {
                            result, err in
                            if let err = err {
                                errorMessage = err.localizedDescription
                                error = true
                            } else {
                                errorMessage = "User Suceessfully created, Please Login now."
                                error = true
                            }
                        }
                    } else {
                        errorMessage = "Password does not match"
                        error = true
                    }
                }
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
                .font(.title3)
                Spacer()
            } .padding()
                .alert(isPresented: $error) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
        }
    }
}
#Preview {
    SignupView()
}
