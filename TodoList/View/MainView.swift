//
//  MainView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 27.09.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        NavigationView{
            if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
               accountView
            } else {
               SignInView()
            }
        }

    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            TodoListView(userId: viewModel.currentUserId)
                .tabItem(){
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem(){
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
