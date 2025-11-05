//
//  ContentView.swift
//  SwiftDataBase
//
//  Created by BATCH03L1 on 25/10/25.
//

import SwiftUI
import SwiftData

@Model
final class Task {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var isCompleted: Bool
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}


struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    @State private var newTaskTitle: String = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Enter new task", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addTask) {
                    Text("Add Task")
                }
                .buttonStyle(BorderedButtonStyle())
            }
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        if task.isCompleted {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        } else {
                            Button("Done") {
                                task.isCompleted = true
                                try? modelContext.save()
                            }
                        }
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        .padding()
    }
    func addTask() {
        let newTask = Task(title: newTaskTitle)
        modelContext.insert(newTask)
        newTaskTitle = ""
        try? modelContext.save()
    }
    func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            modelContext.delete(task)
        }
        try? modelContext.save()
    }
}

#Preview {
    ContentView()
}
