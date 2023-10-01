//
//  NewTodoView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import SwiftUI

struct NewTodoView: View {
    @StateObject var viewModel = NewTodoViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New task")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 70)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                CustomButtonView(title: "Save", backgroundColor: .pink, action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented  = false
                    } else {
                        viewModel.showAlert = true
                    }
                })
            
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date"))
            })
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(newItemPresented: Binding(get: {
            return true
        }, set: {
            _ in
            
        }))
    }
}
