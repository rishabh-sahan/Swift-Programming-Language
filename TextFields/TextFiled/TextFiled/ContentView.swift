//
//  ContentView.swift
//  TextFiled
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TextField("Enter Your Username", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .font(.headline)
            
            SecureField("Enter Your Password", text: .constant(""))
                .textFieldStyle(.roundedBorder)
                .font(.headline)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
