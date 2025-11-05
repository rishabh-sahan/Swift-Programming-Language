//
//  ContentView.swift
//  AnimationWithRotation
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isRotated = false
    @State private var isBig = false
    var body: some View {
        VStack(spacing: 40) {
            Image("siddu")
                .resizable()
                .frame(width: isBig ? 200 : 100, height: isBig ? 200 : 100)
                .cornerRadius(isBig ? 100 : 50)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .animation(.easeInOut(duration: 1).repeatForever(), value: isRotated)
                .animation(.easeInOut(duration: 1).repeatForever(), value: isBig)
            Button("Rotate") {
                isRotated.toggle()
                isBig.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
