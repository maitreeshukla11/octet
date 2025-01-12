//
//  PlayerModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct Player {
    private(set) var playerId: Int
    private(set) var cards: [[Card]]
    //var score: Int
    
    init(playerId: Int, cards: [Card]) {
        self.playerId = playerId
        self.cards = []
        
        for i in 0..<4 {
            let startIndex = i * 2
            let endIndex = startIndex + 2
            let subset = Array(cards[startIndex..<endIndex])
            self.cards.append(subset)
        }
    }
    
    mutating func makeFaceUp(column: Int, row: Int) {
        self.cards[column][row].makeFaceUp()
    }
    
    mutating func replaceCard(cardToBePlaced: Card, column: Int, row: Int) -> Card {
        var cardToBeReplaced = self.cards[column][row]
        self.cards[column][row] = cardToBePlaced
        cardToBeReplaced.makeFaceUp()
        return cardToBeReplaced
    }
    
    func isCardFaceDown(column: Int, row: Int) -> Bool {
        return !self.cards[column][row].isFaceUp
    }
    
    func areAllCardsFaceUp() -> Bool {
        for column in self.cards {
            for card in column {
                if !card.isFaceUp {
                    return false
                }
            }
        }
        return true
    }
    
    mutating func flipAllCardsFaceUp() {
        for column in 0...3 {
            for row in 0...1 {
                self.cards[column][row].makeFaceUp()
            }
        }
    }
    
    func computeScore() -> Int {
        return 0
    }
    
    func checkIfAllCardsAreFaceUp() -> Bool {
        return false
    }
}
