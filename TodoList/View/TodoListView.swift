//
//  TodoListView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var todos: [Todo]

    
    init(userId: String) {
        self._todos = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(todos) {
                    todo in TodoListItemView(todo: todo)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.deleteTodo(id: todo.id)
                            }
                            .tint(.red)
                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("My tasks")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewTodoView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}


struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "QaONI0N5i5bsypQIRYs5PEr0mqH3")
    }
}
