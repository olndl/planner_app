//
//  ConfirmedView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 02.10.2023.
//


import SwiftUI

struct ConfirmedView: View {
    
    @AppStorage("isLoggedIn") var isLogin: Bool = false
    
    var body: some View {
        VStack {
            Image("img3")
            
            Text("Congrats! You are verified")
                .font(.title2)
                .fontWeight(.bold)
            
            Button(action: {
                
                isLogin = true
                
            }, label: {
                Text("Confirmed")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.3, maxHeight: 50)
                    .background(Color("Primary"))
                    .cornerRadius(6)
                    .shadow(color: Color("Primary").opacity(0.8), radius: 6, x: 1, y: 1)
            }).padding()
        }.frame(maxWidth: UIScreen.main.bounds.width / 1.2)
        .padding()
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 25)
        )
        .shadow(color: Color.black.opacity(0.2), radius: 25, x: 1, y: 1)
    }
}

struct Confirmed_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
