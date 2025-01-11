//
//  octetApp.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

@main
struct octetApp: App {
    @State var gameViewModel: GameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            GameView(gameViewModel: gameViewModel)
        }
    }
}
