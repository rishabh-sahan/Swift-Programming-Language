//
//  ContentView.swift
//  ListViewWithNavigation
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI

struct Student: Identifiable {
    let id = UUID()
    let name : String
    let branch : String
    let profile : Image
}
struct ContentView: View {
    var items = [Student(name: "Sundar Pichai", branch: "CSE", profile: Image("sundar-pichai")),
                 Student(name: "Elon Musk", branch: "ISE", profile: Image("elon-musk")),
                 Student(name: "Bill Gates", branch: "ME", profile: Image("bill-gates")),
                 Student(name: "Satya Nadella", branch: "CV",profile: Image("satya-nadella"))]
    var body: some View {
        NavigationStack {
            List(items) { student in
                NavigationLink(destination: StudentDetails(student: student)) {
                    HStack {
                        student.profile
                            .resizable()
                            .frame(width: 50, height:50)
                            .cornerRadius(25)
                        VStack(alignment: .leading) {
                            Text("Name: \(student.name)")
                                .font(.caption)
                            Text("Branch: \(student.branch)")
                        }
                    }
                }
            }
            .navigationTitle("Students List")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
