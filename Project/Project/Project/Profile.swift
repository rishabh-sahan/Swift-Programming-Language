//
//  Profile.swift
//  Project
//
//  Created by BATCH03L1 on 09/10/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            Image("profile")
                .resizable()
                .frame(width:100, height:100)
            Text("Name: Sahan Jain")
            Text("USN: 4PS23CS180")
            Text("Age: 20")
            Text("Gender: Male")
        }
//        VStack(alignment: .center, spacing: 20)  {
//
//        }
        .fontWeight(.semibold)

    }
}
#Preview {
    Profile()
}
