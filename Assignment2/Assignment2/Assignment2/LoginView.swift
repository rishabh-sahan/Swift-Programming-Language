//
//  LoginView.swift
//  Assignment2
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI
struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLogedIn: Bool = false
    @State private var errorMessage: Bool = false

    var body: some View {
        NavigationStack {
            
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
            .background(Color.green)
            
            VStack(alignment: .trailing){
                NavigationLink("Forgot Password") {
                    ForgotPass()
                }
            }
            VStack(alignment: .trailing){
                NavigationLink("Sign Up") {
                    SignupView()
                }
            }
            VStack(alignment: .center) {
                Button("Login") {
                    if email == "Vikas" && password == "rishabh"{
                        isLogedIn = true
                    }else{
                        errorMessage = true
                    }
//                    HomeScreen()
                }
                .fullScreenCover(isPresented: $isLogedIn){
                    HomeScreen()
                }
                .alert("Invalid credentails", isPresented: $errorMessage) {
                            Button("Cancel", role: .cancel) { }
                            Button("OK", role: .destructive) { }
                        } message: {
                            Text("Invalid credentails")
                        }
                .font(.largeTitle)
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
            }
            
            .navigationTitle("Login")
        }
    }
}
#Preview {
    LoginView()
}
