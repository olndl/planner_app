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
        NavigationView() {
            if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
                TodoListView()
            } else {
               SignInView()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
