//
//  octetApp.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

@main
struct octetApp: App {
    var player2Cards: [[(cardValue: String, isFaceUp: Bool)]] = [
        [
            (cardValue: "Q♣", isFaceUp: false),
            (cardValue: "A♦", isFaceUp: true)
        ],
        [
            (cardValue: "10♥", isFaceUp: true),
            (cardValue: "5♠", isFaceUp: false)
        ],
        [
            (cardValue: "K♦", isFaceUp: true),
            (cardValue: "2♣", isFaceUp: false)
        ],
        [
            (cardValue: "7♥", isFaceUp: false),
            (cardValue: "9♣", isFaceUp: true)
        ]
    ]
    
    var player1Cards: [[(cardValue: String, isFaceUp: Bool)]] = [
        [
            (cardValue: "3♣", isFaceUp: true),
            (cardValue: "J♠", isFaceUp: false)
        ],
        [
            (cardValue: "4♦", isFaceUp: false),
            (cardValue: "8♥", isFaceUp: true)
        ],
        [
            (cardValue: "6♠", isFaceUp: true),
            (cardValue: "10♦", isFaceUp: false)
        ],
        [
            (cardValue: "Q♥", isFaceUp: false),
            (cardValue: "A♠", isFaceUp: true)
        ]
    ]
    
    var cardToBePlacedValue: String?
    var drawPile: [String] = ["3♦", "5♦", "7♠"]
    var discard: [String] = ["9♦", "J♥", "Q♠"]
    var playerTurn: Int = 1  // 1 or 2
    var body: some Scene {
        WindowGroup {
            GameView(player2Cards: player2Cards, player1Cards: player1Cards, cardToBePlacedValue: cardToBePlacedValue, drawPile: drawPile, discard: discard, playerTurn: playerTurn)
        }
    }
}
