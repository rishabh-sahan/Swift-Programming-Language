//
//  Signupview.swift
//  Assignment2
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign Up Page")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            VStack(alignment: .leading) {
                Text(" E-Mail ID")
                    .fontWeight(.bold)
                TextField("Enter your Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Text("Password")
                    .fontWeight(.bold)
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            VStack {
                NavigationLink("Confirm") {
                    LoginView()
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
            }
        }
        
    }
}
#Preview {
    SignupView()
}
