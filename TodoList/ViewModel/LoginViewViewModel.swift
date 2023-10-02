//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 02.10.2023.
//


import Foundation
import Firebase
import SwiftUI

class LoginViewViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var isLoadingVerify: Bool = false

    @Published var phoneNumber: String = ""
    @Published var isVerify: Bool = false
    @Published var isVerified: Bool = false
    
    @Published var isError: Bool = false
    @Published var errorMsg: String = ""
}

extension LoginViewViewModel {
    
    func sendCode() {
        
        self.isLoading.toggle()
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationId, error) in
            
            self.isLoading.toggle()
            
            
            UserDefaults.standard.set(verificationId, forKey: "verificationId")
    
            
            if error != nil {
                self.isError.toggle()
                self.errorMsg = error?.localizedDescription ?? ""
                return
            }
     
            self.isVerify.toggle()
        }
    }
    
    func verifyCode(code: String) {
        
        print("Code : \(code)")
        
        self.isLoadingVerify.toggle()
        
        let verificationId = UserDefaults.standard.string(forKey: "verificationId") ?? ""
        let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: code)
        
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            
            self.isLoadingVerify.toggle()
            
            
            if error != nil {
                self.isError.toggle()
                self.errorMsg = error?.localizedDescription ?? ""
                return
            }
            
            print(authResult ?? "")
            self.isVerify.toggle()
            self.isVerified.toggle()
        }
        
    }
}
