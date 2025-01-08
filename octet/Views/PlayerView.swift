//
//  PlayerView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct PlayerView: View {
    var playerId: Int
    var cards: [[(cardValue: String, isFaceUp: Bool)]]
    
    var cardWidth: CGFloat
    
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
    var playerId: Int = 1
    var cards: [[(cardValue: String, isFaceUp: Bool)]] = [
        [
            (cardValue: "0", isFaceUp: false),
            (cardValue: "11", isFaceUp: true)
        ],
        [
            (cardValue: "1", isFaceUp: true),
            (cardValue: "5", isFaceUp: false)
        ],
        [
            (cardValue: "9", isFaceUp: true),
            (cardValue: "2", isFaceUp: false)
        ],
        [
            (cardValue: "3", isFaceUp: false),
            (cardValue: "3", isFaceUp: true)
        ]
    ]
    var cardWidth: CGFloat = 90
    PlayerView(playerId: playerId, cards: cards, cardWidth: cardWidth)
}
