//
//  OctetNavigationStack.swift
//  octet
//
//  Created by Sarju Thakkar on 1/13/25.
//


import SwiftUI

struct OctetNavigationStack: View {
    @Binding var gameViewModel: GameViewModel

    @State private var navigationPath: [OctetScreen] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            HomePageView(gameViewModel: $gameViewModel, navigationPath: $navigationPath)
                .navigationDestination(for: OctetScreen.self) { screen in
                    switch screen {
                    case .home:
                        HomePageView(gameViewModel: $gameViewModel, navigationPath: $navigationPath)
                    case .game:
                        GameView(gameViewModel: $gameViewModel)
                    case .rules:
                        RuleView()
                    case .settings:
                        SettingsView()
                    }
                }
        }
    }
}

enum OctetScreen: Hashable {
    case home
    case game
    case rules
    case settings
}
