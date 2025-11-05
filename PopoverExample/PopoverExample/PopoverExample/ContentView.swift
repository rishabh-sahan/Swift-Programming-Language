//
//  ContentView.swift
//  PopoverExample
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopover = false
    var body: some View {
        VStack {
            Button("Show Popover") {
                self.showPopover.toggle()
            }
        }
        .popover(isPresented: $showPopover, arrowEdge: .bottom) {
            Text("🥳")
            Text("This is a popover")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
