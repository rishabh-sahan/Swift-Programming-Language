//
//  ContentView.swift
//  ConfirmationDialogSheet
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var ShowConfirmationDilog = false
    var body: some View {
        VStack {
            Button("Show Confirmation Dialog") { 
                ShowConfirmationDilog = true
            }
        }
        .confirmationDialog("Are you sure, you want to proceed ?", isPresented: $ShowConfirmationDilog, titleVisibility: .visible) {
            Button("Option1", role: .destructive) {
                
            }
            Button("Option2", role: .destructive) {
                
            }
            Button("Cancel", role: .cancel) {
                
            }
        } message: {
            Text("This action cannot be undone")
        }
    }
}

#Preview {
    ContentView()
}
