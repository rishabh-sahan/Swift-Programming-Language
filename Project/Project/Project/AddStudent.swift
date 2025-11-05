//
//  AddStudent.swift
//  PESC
//
//  Created by venkata ramana B R on 09/10/25.
//

import SwiftUI
import FirebaseFirestore

struct Student :Identifiable,Codable {
    @DocumentID var id: String?
    var name: String
    var branch: String
    var roolNumber: String
}

struct AddStudent: View {
    @State private var name: String = ""
    @State private var branch: String = ""
    @State private var roolNumber: String = ""
    
    let db = Firestore.firestore()
    
    var body: some View {
        Text("Add Student")
        TextField("Name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Branch", text: $branch)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        TextField("Rool Number", text: $roolNumber)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        Button("submit"){
            let student = Student(name: name, branch: branch, roolNumber: roolNumber)
            do {
                try db.collection("students").addDocument(from: student)
            } catch {
                print(error)
            }
            
        }
            
    }
}
#Preview {
    AddStudent()
}
