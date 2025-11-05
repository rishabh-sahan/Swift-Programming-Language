//
//  WelcomeView.swift
//  PresentationController
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isShowingLogin = false
    var body: some View {
        VStack {
            Button("Go to next page") {
                isShowingLogin = true
            }
            .font(.title)
            .buttonStyle(.bordered)
        }
        .fullScreenCover(isPresented: $isShowingLogin) {
            LoginView()
        }
//        .sheet(isPresented: $isShowingLogin) {
//            LoginView()
//        }
    }
}

#Preview {
    WelcomeView()
}
