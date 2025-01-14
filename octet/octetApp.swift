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
            OctetNavigationStack(gameViewModel: $gameViewModel) // Single navigation implementation
        }
    }
}
