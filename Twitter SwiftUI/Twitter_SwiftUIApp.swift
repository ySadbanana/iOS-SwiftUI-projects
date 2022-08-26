//
//  Twitter_SwiftUIApp.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 20.01.2021.
//

import SwiftUI
import Firebase

@main
struct Twitter_SwiftUIApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
