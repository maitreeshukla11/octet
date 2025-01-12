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
}


