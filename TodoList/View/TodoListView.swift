//
//  TodoListView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
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
//        .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        VStack {
//                            Text("My Tasks")
//                                .font(.title)
//                                .bold()
//                        }
//                    }
//                }
    }
}


struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "")
    }
}
