//
//  GameView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct GameView: View {
    var player2Cards: [[(cardValue: String, isFaceUp: Bool)]]
    var player1Cards: [[(cardValue: String, isFaceUp: Bool)]]
    var cardToBePlacedValue: String?
    var deck: [String]
    var discard: [String]
    var playerTurn: Int
    
    var body: some View {
        GeometryReader { geometry in
            let cardWidth = (geometry.size.width) / Constants.cardWidthFactor
            ZStack {
                VStack {
                    PlayerView(playerId: Constants.player2Id, cards: player2Cards, cardWidth: cardWidth)
                    CenterSetUpView(
                        cardToBePlacedValue: cardToBePlacedValue,
                        deck: deck,
                        discard: discard,
                        playerTurn: playerTurn,
                        cardWidth: cardWidth
                    )
                    PlayerView(playerId: Constants.player1Id, cards: player1Cards, cardWidth: cardWidth)
                }
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
        .padding(Constants.margins)
    }
    
    private struct Constants {
        static let cardWidthFactor: CGFloat = 4.75
        static let player1Id: Int = 1
        static let player2Id: Int = 2
        static let margins: CGFloat = 10
        
    }
}

#Preview {
    var player2Cards: [[(cardValue: String, isFaceUp: Bool)]] = [
        [
            (cardValue: "0", isFaceUp: false),
            (cardValue: "11", isFaceUp: true)
        ],
        [
            (cardValue: "10", isFaceUp: true),
            (cardValue: "5", isFaceUp: false)
        ],
        [
            (cardValue: "9", isFaceUp: true),
            (cardValue: "2", isFaceUp: false)
        ],
        [
            (cardValue: "7", isFaceUp: false),
            (cardValue: "9", isFaceUp: true)
        ]
    ]
    
    var player1Cards: [[(cardValue: String, isFaceUp: Bool)]] = [
        [
            (cardValue: "3", isFaceUp: true),
            (cardValue: "1", isFaceUp: false)
        ],
        [
            (cardValue: "0", isFaceUp: false),
            (cardValue: "8", isFaceUp: true)
        ],
        [
            (cardValue: "6", isFaceUp: true),
            (cardValue: "10", isFaceUp: false)
        ],
        [
            (cardValue: "3", isFaceUp: false),
            (cardValue: "11", isFaceUp: true)
        ]
    ]
    
    var cardToBePlacedValue: String?
    var deck: [String] = ["3", "5", "7"]
    var discard: [String] = ["6", "5", "2"]
    var playerTurn: Int = 1  // 1 or 2
    GameView(player2Cards: player2Cards, player1Cards: player1Cards, cardToBePlacedValue: cardToBePlacedValue, deck: deck, discard: discard, playerTurn: playerTurn)
}
