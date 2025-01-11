//
//  GameStateModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct GameState {
    private(set) var activePlayerId: Int
    private(set) var cardToBePlaced: Card?
    private(set) var discardPileTopCard: Card
    private(set) var player1: Player
    private(set) var player2: Player
    private(set) var deck: Deck
    private(set) var gameOver: Bool
    
    init() {
        self.deck = Deck()
        self.player1 = Player(playerId: 1, cards: self.deck.dealEightCards())
        self.player2 = Player(playerId: 2, cards: self.deck.dealEightCards())
        self.activePlayerId = 1
        self.discardPileTopCard = self.deck.drawTopCard()
        self.gameOver = false
    }
    
    mutating func tapPlayerCard(column: Int, row: Int, playerId: Int) {
        if self.activePlayerId == playerId {
            if cardToBePlaced == nil {
                flipCard(column: column, row: row, playerId: playerId)
            } else {
                //replaceCard()
            }
        }
    }
    
    mutating func flipCard(column: Int, row: Int, playerId: Int) {
        if playerId == 1 {
            player1.flipCard(column: column, row: row)
        } else {
            player2.flipCard(column: column, row: row)
        }
    }
    
    
    mutating func handlePlayerTurnEnd() {
        
    }
    
    func handleGameOver () {
        
    }
}
