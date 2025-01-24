//
//  CardModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct Card {
    private(set) var isFaceUp: Bool
    private(set) var cardValue: String
    
    mutating func makeFaceUp() {
        self.isFaceUp = true
    }
    
    func isOctopus() -> Bool {
        return self.cardValue == "🐙"
    }
    
    func numericValue() -> Int {
        if let num = Int(cardValue) {
            return num
        } else {
            return -1
        }
    }
}


