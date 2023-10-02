//
//  Todo.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import Foundation


struct Todo: Codable, Identifiable {
    let id: String
    let title: String
    let createdDate: TimeInterval
    let dueDate: TimeInterval
    var isDone: Bool
    
    mutating func toggle(_ state: Bool) {
        isDone = state
    }
}
