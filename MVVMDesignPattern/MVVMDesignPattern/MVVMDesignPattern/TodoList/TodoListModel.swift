//
//  TodoListModel.swift
//  MVVMDesignPattern
//
//  Created by BATCH03L1 on 31/10/25.
//

import Foundation

struct TodoListModel: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
    
}
