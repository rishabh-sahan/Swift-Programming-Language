//
//  OTPView.swift
//  NavigationController
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI
struct OTPVIEW: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Enter OTP")
                    .font(.largeTitle)
                NavigationLink("Home Screen") {
                    HomeScreen()
                }
            }
            .navigationTitle("OTP Verification")
        }
    }
}
#Preview {
    OTPVIEW()
}
