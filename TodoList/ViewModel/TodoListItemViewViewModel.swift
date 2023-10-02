//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for single todo
class TodoListItemViewViewModel: ObservableObject{
    init() {}
    
    func toggle(todo: Todo) {
        var newTodo = todo
        newTodo.toggle(!todo.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("tasks")
            .document(newTodo.id)
            .setData(newTodo.asDict())
    }
    
}
