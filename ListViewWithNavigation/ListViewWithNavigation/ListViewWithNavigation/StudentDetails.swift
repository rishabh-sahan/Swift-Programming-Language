//
//  StudentDetails.swift
//  ListViewWithNavigation
//
//  Created by BATCH03L1 on 08/10/25.
//


import SwiftUI

struct StudentDetails: View {
    var student: Student
    var body: some View {
        VStack {
            student.profile
                .resizable()
                .frame(width: 100, height:100)
                .cornerRadius(50)
            Text("Name: \(student.name)")
                .font(.title)
                .padding()
            Text("Branch: \(student.branch)")
                .font(.title2)
            Spacer()
        }
        .navigationTitle("Student Details")
        .padding()
    }
}

#Preview {
    StudentDetails(student: Student(name: "Sundar Pichai", branch: "CSE", profile: Image("sundar-pichai")))
}
