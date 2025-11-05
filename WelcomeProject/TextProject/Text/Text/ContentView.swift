//
//  ContentView.swift
//  Text
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Spacer()
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.orange)
            //.lineLimit(2)
            .background(Color.black)
            
        
        Spacer()
        
        
        }
    }

#Preview {
    ContentView()
}
