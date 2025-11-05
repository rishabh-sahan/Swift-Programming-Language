//
//  Students.swift
//  PESC
//
//  Created by venkata ramana B R on 09/10/25.
//

import SwiftUI
import FirebaseFirestore
struct Students: View {
    @State var students:[Student] = []
    let db = Firestore.firestore()
    
    var body: some View {
        VStack{
            
            List(students){ student in
                VStack(alignment: .leading){
                    Text("Name: \(student.name)")
                    Text("RollNumber: \(student.roolNumber)")
                    Text("Branch: \(student.branch)")
                }
                
            }
            .onAppear{
                db.collection("students").addSnapshotListener { snapshot, error in
                    guard let documents = snapshot?.documents else {
                        print("No documents")
                        return
                    }
                    
                    self.students = documents.compactMap { doc in
                        try? doc.data(as: Student.self)
                    }
                    
                }
            }
            
        }
    }
}
#Preview {
    Students()
}
