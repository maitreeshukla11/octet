//
//  GameView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct GameView: View {
    @State var gameViewModel: GameViewModel
    
    var body: some View {
        GeometryReader { geometry in
            let cardWidth = (geometry.size.width) / Constants.cardWidthFactor
            ZStack {
                VStack {
                    PlayerView(player: gameViewModel.gameState.player2, cardWidth: cardWidth, gameViewModel: $gameViewModel)
                    CenterSetUpView(
                        cardToBePlaced: gameViewModel.gameState.cardToBePlaced,
                        deckHasCards: gameViewModel.gameState.deck.hasCards(),
                        discard: gameViewModel.gameState.discardPileTopCard,
                        activePlayer: gameViewModel.gameState.activePlayerId,
                        cardWidth: cardWidth
                    )
                    PlayerView(player: gameViewModel.gameState.player1, cardWidth: cardWidth, gameViewModel: $gameViewModel)
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
        static let margins: CGFloat = 10
        
    }
}

#Preview {
    var gameViewModel: GameViewModel = GameViewModel()
    GameView(gameViewModel: gameViewModel)
}
