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
    //var allCardsFaceUp: Bool
    
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
    
    mutating func flipCard(column: Int, row: Int) {
        self.cards[column][row].flip()
    }
    
    func computeScore() -> Int {
        return 0
    }
    
    func checkIfAllCardsAreFaceUp() -> Bool {
        return false
    }
}
