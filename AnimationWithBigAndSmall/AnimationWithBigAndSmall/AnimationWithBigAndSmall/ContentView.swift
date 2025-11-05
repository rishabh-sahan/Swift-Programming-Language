//
//  ContentView.swift
//  AnimationWithBigAndSmall
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isSmall = false
    var body: some View {
        VStack(spacing: 200) {
            Circle()
                .fill(.red)
                .frame(width: isSmall ? 200 : 100, height: isSmall ? 200 : 100)
                .animation(.easeInOut(duration: 0.5), value: isSmall)
            Text("Stop !!")
                .font(.largeTitle)
                .font(isSmall ? .largeTitle: .body)
                .animation(.easeInOut(duration: 0.5), value: isSmall)
            Button("Toggle Size") {
                isSmall.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
