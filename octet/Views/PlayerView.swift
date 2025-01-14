//
//  PlayerView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct PlayerView: View {
    var player: Player
    
    var cardWidth: CGFloat
    
    @Binding var gameViewModel: GameViewModel
    @AppStorage("rotatePlayer2") private var rotatePlayer2 = true
    
    var body: some View {
        HStack {
            ForEach(0..<player.cards.count, id: \.self) { columnIndex in
                VStack {
                    ForEach(0..<player.cards[columnIndex].count, id: \.self) { rowIndex in
                        let card = player.cards[columnIndex][rowIndex]
                        CardView(card: card)
                        .onTapGesture {
                            gameViewModel.tapPlayerCard(column: columnIndex, row: rowIndex, playerId: player.playerId)
                        }
                        .frame(width: cardWidth)
                    }
                }
            }
        }
        .rotationEffect(.degrees(player.playerId == 2 && rotatePlayer2 ? 180 : 0))
    }
}


#Preview {
    var gameViewModel: GameViewModel = GameViewModel()
    var cards: [Card] = [Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "1")]
    PlayerView(player: Player(playerId: 1, cards: cards), cardWidth: 90, gameViewModel: .constant(gameViewModel))
}
