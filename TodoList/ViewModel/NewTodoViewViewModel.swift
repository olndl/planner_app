//
//  NewTodoViewViewModel.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewTodoViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newTodo = Todo(
            id: newId,
            title: title,
            createdDate: Date().timeIntervalSince1970,
            dueDate: dueDate.timeIntervalSince1970,
            isDone: false
        )
        
        // save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("tasks")
            .document(newId)
            .setData(newTodo.asDict())
        
        
    }
    
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
