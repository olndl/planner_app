//
//  SignUpView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Sign Up", subtitle: "Start organizing your plans", backgroundColor: Color.pink, cornerRadius: 0, angle: 15)
            Form{
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                CustomButtonView(title: "Create account", backgroundColor: .green, action: {
                    //sign up
                    viewModel.register()
                })
            
            }
            .cornerRadius(12)
            .frame(width: UIScreen.main.bounds.width - 20, height: 280)
            .offset(y: -100)
        
       
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
