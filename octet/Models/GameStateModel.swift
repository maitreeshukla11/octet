//
//  GameStateModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct GameState {
    var activePlayerId: Int
    var cardToBePlaced: Card
    var discardPileTopCard: Card
}
