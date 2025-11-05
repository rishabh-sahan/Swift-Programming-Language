//
//  ContentView.swift
//  ListView
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    var items = ["Apple", "Banana", "cherry", "berry", "date", "Mango"]
    var body: some View {
        VStack {
            List(items, id: \.self) { item in Text(item)}
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
