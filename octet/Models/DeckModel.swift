//
//  DeckModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct Deck {
    private(set) var deck: [Card]
    
    init() {
        self.deck = []
        for _ in 1...8 {
            for number in 0...12 {
                let card = Card(isFaceUp: false, cardValue: String(number))
                deck.append(card)
            }
        }
        for _ in 1...4 {
            let card = Card(isFaceUp: false, cardValue: "🐙")
            deck.append(card)
        }
        deck.shuffle()
    }
    
   mutating func dealEightCards() -> [Card] {
       let playerInitialCards = Array(deck.prefix(8))
       deck.removeFirst(8)
       return playerInitialCards
    }
    
    mutating func drawTopCard() -> Card {
        return deck.removeFirst()
    }
    
}




