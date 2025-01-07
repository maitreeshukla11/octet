//
//  PlayerView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct PlayerView: View {
    
    var playerId: Int = 1
    var cards: [[(cardValue: String, isFaceUp: Bool)]] = [
        [
            (cardValue: "A♠", isFaceUp: true),
            (cardValue: "10♥", isFaceUp: false)
        ],
        [
            (cardValue: "K♦", isFaceUp: false),
            (cardValue: "5♣", isFaceUp: true)
        ],
        [
            (cardValue: "2♦", isFaceUp: false),
            (cardValue: "J♣", isFaceUp: true)
        ],
        [
            (cardValue: "Q♠", isFaceUp: false),
            (cardValue: "7♥", isFaceUp: false)
        ]
    ]
    var cardWidth: CGFloat = 90
    
    var body: some View {
            HStack {
                ForEach(0..<cards.count, id: \.self) { columnIndex in
                    VStack {
                        ForEach(0..<cards[columnIndex].count, id: \.self) { rowIndex in
                            let cardData = cards[columnIndex][rowIndex]
                            CardView(
                                isFaceUp: cardData.isFaceUp,
                                cardValue: cardData.cardValue
                            )
                            .frame(width: cardWidth)
                        }
                    }
                }
            }
            .rotationEffect(.degrees(playerId == 1 ? 0 : 180))
        }
    }


#Preview {
    PlayerView()
}
