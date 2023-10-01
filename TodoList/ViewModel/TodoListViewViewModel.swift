//
//  TodoListViewViewModel.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import Foundation

/// ViewModel for list of items
class TodoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    init() {}
}
