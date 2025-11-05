//
//  ContentView.swift
//  TextFieldsWithData
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPasswordAndEmail: Bool = false
    var body: some View {
        VStack {
            TextField("Enter your Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding()
            SecureField("Enter your password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: {
                showPasswordAndEmail.toggle()
            }){
                Text("Show Or Hide")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
            }
            
            if showPasswordAndEmail {
                Text(" Your Email: \(email), and Your Password: \(password)")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
