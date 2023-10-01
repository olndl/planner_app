//
//  SignInViewViewModel.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import Foundation
import FirebaseAuth

class SignInViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        //log in
        Auth.auth().signIn(withEmail: email, password: password)

    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
