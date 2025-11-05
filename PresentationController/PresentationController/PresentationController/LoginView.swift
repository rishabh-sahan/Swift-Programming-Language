//
//  LoginView.swift
//  PresentationController
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isHomePage = false

    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
        .position(x: 50, y:50)
        VStack {
            Button("Go to Home") {
                isHomePage = true
            }
            .position(x: 200, y: 10)
        }
        .fullScreenCover(isPresented: $isHomePage) {
            HomePage()
        }
        Text("This is Login View")
            .font(.largeTitle)
        
    }
}

#Preview {
    LoginView()
}
