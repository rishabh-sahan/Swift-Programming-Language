//
//  LoginView.swift
//  NavigationController
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Login") {
                    OTPVIEW()
                }
                .font(.largeTitle)
            }
            .navigationTitle("Login")
        }
    }
}

#Preview {
    LoginView()
}
