//
//  TodoListView.swift
//  MVVMDesignPattern
//
//  Created by BATCH03L1 on 31/10/25.
//

import SwiftUI
struct TodoListView: View {
    @StateObject private var viewModel = TodoListViewModel()
    @State private var newTask = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        viewModel.addTodo(title: newTask)
                        newTask = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
                .padding()
                List {
                    ForEach(viewModel.todos) { todo in
                        HStack{
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    viewModel.toggleCompletion(for: todo)
                                }
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                        }
                    }
                }
            }.navigationTitle("My Tasks")
        }
    }
}

#Preview {
    TodoListView()
}
