//
//  Students.swift
//  Assignment2
//
//  Created by BATCH03L1 on 23/09/25.
//

import SwiftUI

struct Students: View {
    var body: some View {
        let students = ["Rishabh", "Vikas", "Rahul", "Rakesh", "Sanjan", "Abhishek", "Srujan", "Siddesh", "Saroj", "Vedansh"]
        
        VStack {
            List(students, id: \.self) { item in Text(item)}
        }
    }
}
