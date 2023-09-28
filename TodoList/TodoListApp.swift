//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ольга Ширявцева on 27.09.2023.
//

import SwiftUI
import FirebaseCore

@main
struct TodoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
