//
//  octetApp.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

@main
struct octetApp: App {
    @State var gameViewModel: GameViewModel = GameViewModel() // Initialize GameViewModel

    var body: some Scene {
        WindowGroup {
            NavigationView { // Embed in NavigationView for navigation capabilities
                HomePageView(gameViewModel: $gameViewModel) // Pass as Binding
                    .navigationBarHidden(true) // Optionally hide the navigation bar on Home Page
            }
        }
    }
}

