//
//  ForgotPass.swift
//  Assignment2
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct ForgotPass: View {
    @State private var showAlert = false
    var body: some View {
        Text("Forgot Password Page")
            .font(.largeTitle)
            .fontWeight(.bold)
        
        VStack {
            Button("Change Password"){
                showAlert = true
            }
        }
        .alert("Important Message", isPresented: $showAlert){
            Button("Cancel", role: .cancel){}
            Button("OK", role: .destructive){}

        } message: {
            Text("Please read this important message.")
        }
    }
}
#Preview {
    ForgotPass()
}
