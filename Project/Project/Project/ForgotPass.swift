//
//  ForgotPass.swift
//  Project
//
//  Created by BATCH03L1 on 09/10/25.
//
import SwiftUI

struct ForgotPass: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var showConfirmation = false

    var body: some View {
        VStack(spacing: 25) {
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Enter your email and we'll send you a link to reset your password.")
                .multilineTextAlignment(.center)
                .font(.body)
                .padding(.horizontal)

            TextField("Enter your email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            Button("Send Reset Link") {
                // Simulate reset email sending
                showConfirmation = true
            }
            .fontWeight(.bold)
            .buttonStyle(.borderedProminent)
            .font(.title3)

            Spacer()
        }
        .padding()
        .navigationTitle("Reset Password")
        .alert("Reset Link Sent", isPresented: $showConfirmation) {
            Button("OK") {
                dismiss()
            }
        } message: {
            Text("If an account exists for \(email), a reset link has been sent.")
        }
    }
}

#Preview {
    ForgotPass()
}
