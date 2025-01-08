//
//  PlayerModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct Player {
    var playerId: Int
    var cards: [[Card]]
    //var score: Int
    //var allCardsFaceUp: Bool
    
    func computeScore() -> Int {
        return 0
    }
    
    func checkIfAllCardsAreFaceUp() -> Bool {
        return false
    }
}
