//
//  TodoListViewModel.swift
//  MVVMDesignPattern
//
//  Created by BATCH03L1 on 31/10/25.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todos: [TodoListModel] = [TodoListModel(title: "Buy milk", isCompleted: false),
                              TodoListModel(title: "Finish project", isCompleted: true)]
    // this function add the task
    // function name: at
    
    func addTodo(title: String) {
        let newTodo = TodoListModel(title: title, isCompleted: false)
        todos.append(newTodo)
    }
    
    func toggleCompletion(for todo: TodoListModel) {
        if let index = todos.firstIndex(where: { $0.id == todo.id}) {
            todos[index].isCompleted.toggle()
        }
    }
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}
