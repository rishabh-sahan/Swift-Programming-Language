//
//  ContentView.swift
//  AlertExample
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        VStack {
            Button("Show Alert"){
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
    ContentView()
}
