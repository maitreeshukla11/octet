//
//  GameStateModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct GameState {
    var activePlayerId: Int
    var cardToBePlaced: Card
    var discardPileTopCard: Card
    var player1: Player
    var player2: Player
    var deck: Deck
    var gameOver: Bool
    
    mutating func handlePlayerTurnEnd() {
        
    }
    
    func handleGameOver () {
        
    }
}
