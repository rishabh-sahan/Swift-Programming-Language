//
//  HomePage.swift
//  PresentationController
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct HomePage: View {
    @Environment(\.dismiss) private var Back
    var body: some View {
        Text("This is Home Page")
            .font(.largeTitle)
        Button("Dismiss") {
            Back()
        }
    }
}

#Preview {
    HomePage()
}
