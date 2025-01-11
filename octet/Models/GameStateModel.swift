//
//  GameStateModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct GameState {
    var activePlayerId: Int
    var cardToBePlaced: Card?
    var discardPileTopCard: Card
    var player1: Player
    var player2: Player
    var deck: Deck
    var gameOver: Bool
    
    init() {
        self.deck = Deck()
        self.player1 = Player(playerId: 1, cards: self.deck.dealEightCards())
        self.player2 = Player(playerId: 2, cards: self.deck.dealEightCards())
        self.activePlayerId = 1
        self.discardPileTopCard = self.deck.drawTopCard()
        self.gameOver = false
    }
    
    mutating func handlePlayerTurnEnd() {
        
    }
    
    func handleGameOver () {
        
    }
}
