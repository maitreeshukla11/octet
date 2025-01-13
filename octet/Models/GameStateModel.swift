//
//  GameStateModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct GameState {
    private(set) var activePlayerId: Int?
    private(set) var cardToBePlaced: Card?
    private(set) var discardPileTopCard: Card?
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
            if self.cardToBePlaced == nil {
                if (isTappedCardFaceDown(column: column, row: row)) {
                    makeFaceUp(column: column, row: row)
                    handlePlayerTurnEnd()
                }
            } else {
                replaceCard(column: column, row: row)
                if (self.cardToBePlaced == nil) {
                    handlePlayerTurnEnd()
                }
            }
        }
    }
    
    func isTappedCardFaceDown(column: Int, row: Int) -> Bool {
        if self.activePlayerId == 1 {
            player1.isCardFaceDown(column: column, row: row)
        } else {
            player2.isCardFaceDown(column: column, row: row)
        }
    }
    
    mutating func makeFaceUp(column: Int, row: Int) {
        if self.activePlayerId == 1 {
            player1.makeFaceUp(column: column, row: row)
        } else {
            player2.makeFaceUp(column: column, row: row)
        }
    }
    
    mutating func tapDiscardCard() {
        if self.cardToBePlaced == nil && self.activePlayerId != nil {
            self.cardToBePlaced = self.discardPileTopCard
            self.discardPileTopCard = nil
        }
    }
    
    mutating func tapDeck() {
        if self.cardToBePlaced == nil && self.activePlayerId != nil {
            self.cardToBePlaced = self.deck.drawTopCard()
        }
    }
    
    mutating func replaceCard(column: Int, row: Int) {
        var cardToBeReplaced: Card
        if self.activePlayerId == 1 {
            cardToBeReplaced =  player1.replaceCard(cardToBePlaced: self.cardToBePlaced!, column: column, row: row)
        } else {
            cardToBeReplaced = player2.replaceCard(cardToBePlaced: self.cardToBePlaced!, column: column, row: row)
        }
        if (cardToBeReplaced.isOctopus() && cardToBeReplaced.isFaceUp) {
            self.cardToBePlaced = cardToBeReplaced
        } else {
            self.discardPileTopCard = cardToBeReplaced
            self.discardPileTopCard!.makeFaceUp()
            self.cardToBePlaced = nil
        }
    }
    
    
    mutating func handlePlayerTurnEnd() {
        if self.activePlayerId == 1 {
            if player2.areAllCardsFaceUp() == true {
                handleGameOver()
            } else {
                self.activePlayerId = 2
            }
        } else {
            if player1.areAllCardsFaceUp() == true {
                handleGameOver()
            } else {
                self.activePlayerId = 1
            }
        }
    }
    
    
    mutating func handleGameOver() {
        player1.flipAllCardsFaceUp()
        player2.flipAllCardsFaceUp()
        self.activePlayerId = nil
    }
}
