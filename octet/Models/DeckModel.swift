//
//  DeckModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct Deck {
    var deck: [Card]
    
    mutating func drawTopCard() -> Card {
        return Card(isFaceUp: true, cardValue: "1")
    }
    
}




