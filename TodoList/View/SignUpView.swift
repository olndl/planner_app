//
//  SignUpView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import SwiftUI

struct SignUpView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            HeaderView(title: "Sign Up", subtitle: "Start organizing your plans", backgroundColor: Color.pink, cornerRadius: 0, angle: 15)
            Form{
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $email).textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                CustomButtonView(title: "Create account", backgroundColor: .green, action: {
                    //sign up
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
