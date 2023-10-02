//
//  LoginView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 02.10.2023.
//


import SwiftUI

struct Login: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
        
                Text("OTP Verification")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(20)
                
                Text("We will send you an \(Text("One Time Password").fontWeight(.bold).foregroundColor(.black)) on this mobile number")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                Text("Enter Mobile Number")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding()
                
                TextField("+1", text: $viewModel.phoneNumber)
                    .font(.title2)
                    .frame(maxWidth: UIScreen.main.bounds.width / 2, maxHeight: 60)
                    .keyboardType(.phonePad)
                
                Divider()
                    .frame(maxWidth: UIScreen.main.bounds.width / 2, maxHeight: 1)
                    .padding(.bottom)
                
                CustomButtonView(title: "Send OTP", backgroundColor: .pink, action: {
                    viewModel.sendCode()
                    viewModel.isVerify.toggle()
                }).frame(height: 100)
            
            }
            .blur(radius: viewModel.isLoading || viewModel.isVerify || viewModel.isVerified ? 1 : 0)

            if viewModel.isLoading {
                Loading()
            }
            
            VerificationView(viewModel: viewModel)
            .opacity(viewModel.isVerify ? 1 : 0)
            .scaleEffect(CGSize(width: 1, height: 1))
         
            
            ConfirmedView()
                //.opacity(viewModel.isVerified ? 1 : 0)
                .scaleEffect(CGSize(width: viewModel.isVerified ? 1 : 0, height: viewModel.isVerified ? 1 : 0), anchor: .center)
        }
        .alert(isPresented: $viewModel.isError, content: {
            Alert(title: Text("Error"), message: Text(viewModel.errorMsg))
        })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct Loading: View {
    var body: some View {
        ProgressView()
    }
}
