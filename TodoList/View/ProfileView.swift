//
//  ProfileView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 29.09.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user {
                  provileView(user: user)
                } else {
                    Text("Loading profile...")
                }
                
            }
            .navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func provileView(user: User) -> some View {
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        VStack(alignment: .leading) {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joinedTime).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        Button("Sign Out"){
            viewModel.signOut()
        }
        .tint(.red)
        .padding()
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
