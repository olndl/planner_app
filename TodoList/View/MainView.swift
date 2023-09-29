//
//  MainView.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 27.09.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView() {
            SignInView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
