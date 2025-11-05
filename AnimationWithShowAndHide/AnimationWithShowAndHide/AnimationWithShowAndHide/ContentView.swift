//
//  ContentView.swift
//  AnimationWithShowAndHide
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isVisible = false
    var body: some View {
        VStack(spacing: 40) {
            Image("blackhole")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.tint)
                .opacity(isVisible ? 1 : 0)
                .rotationEffect(isVisible ? .degrees (360) : .degrees(0))
                .animation(.easeInOut(duration: 1).repeatForever(), value: isVisible)
            Button("Rotate") {
                isVisible.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
