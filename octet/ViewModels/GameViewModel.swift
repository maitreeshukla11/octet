//
//  GameViewModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/11/25.
//

import SwiftUI

@Observable class GameViewModel {
    private(set) var gameState: GameState = GameState()
    
    func tapPlayerCard(column: Int, row: Int, playerId: Int) {
        self.gameState.tapPlayerCard(column: column, row: row, playerId: playerId)
    }
    
    func tapDiscardCard() {
        self.gameState.tapDiscardCard()
    }
    
    func tapDeck() {
        self.gameState.tapDeck()
    }
    
    func newGame() {
        self.gameState.newGame()
    }
    
    func setGameToStarted() {
        self.gameState.setGameToStarted()
    }
}


