//
//  NewTodoViewViewModel.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import Foundation

class NewTodoViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init() {}
    
    func save() {}
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // due date is greater then or equal to yesterday
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
}
