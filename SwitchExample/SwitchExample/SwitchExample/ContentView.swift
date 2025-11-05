//
//  ContentView.swift
//  SwitchExample
//
//  Created by BATCH03L1 on 20/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    @State private var password: String = ""
    var body: some View {
        VStack {
            if isOn {
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            } else {
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            Toggle("Show Pasword", isOn: $isOn)
            
        }
        .padding()
    }
}

#Preview {
}
