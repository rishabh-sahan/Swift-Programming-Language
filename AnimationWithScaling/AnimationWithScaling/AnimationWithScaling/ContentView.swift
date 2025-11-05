//
//  ContentView.swift
//  AnimationWithScaling
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isScaled = false
    @State private var isVisible = false

    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .offset(x: isScaled ? 160 : 0, y: isScaled ? 380 : 0)
                .scaleEffect(isScaled ? 0.5 : 1.0)
                .rotationEffect(isScaled ? .degrees (360) : .degrees(0))
                .animation(.easeInOut(duration: 1).repeatForever(), value: isScaled)
            Button("Toggle Scale") {
                isScaled.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
