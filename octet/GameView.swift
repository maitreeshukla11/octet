//
//  GameView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct GameView: View {
    let player2Cards: [[(cardValue: String, isFaceUp: Bool)]] = [
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
    
    let player1Cards: [[(cardValue: String, isFaceUp: Bool)]] = [
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
    
    let cardToBePlacedValue: String = "K♥"
    let drawPile: [String] = ["3♦", "5♦", "7♠"]
    let discard: [String] = ["9♦", "J♥", "Q♠"]
    let playerTurn: Int = 1  // 1 or 2
    
    var body: some View {
        GeometryReader { geometry in
            let cardWidth = (geometry.size.width) / 4.75
            ZStack {
                VStack {
                    PlayerView(playerId: 2, cards: player2Cards, cardWidth: cardWidth)
                    CenterSetUpView(
                        cardToBePlacedValue: cardToBePlacedValue,
                        drawPile: drawPile,
                        discard: discard,
                        playerTurn: playerTurn,
                        cardWidth: cardWidth
                    )
                    PlayerView(playerId: 1, cards: player1Cards, cardWidth: cardWidth)
                }
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
        .padding()
    }
}

#Preview {
    GameView()
}
