//
//  ScoreView.swift
//  octet
//
//  Created by Maitree Shukla on 1/23/25.
//

import SwiftUI

struct ScoreView: View {
    var player1Score : Int
    var player2Score : Int
    @Binding var gameViewModel: GameViewModel
    
    var body: some View {
        VStack {
            Text("Player 2 Score: " + String(player2Score))
            if player1Score < player2Score {
                Text("Player 1 Wins!")
                    .font(.headline)
                    .foregroundStyle(.green)
            } else if player2Score < player1Score {
                Text("Player 2 Wins!")
                    .font(.headline)
                    .foregroundStyle(.green)
            } else {
                Text("It's a tie!")
                    .font(.headline)
                    .foregroundStyle(.green)
            }
            Text("Player 1 Score: " + String(player1Score))
            Button(action: {
                gameViewModel.newGame()
            }) {
                Text("New Game")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    var gameViewModel: GameViewModel = GameViewModel()
    ScoreView(player1Score: -10, player2Score: -20, gameViewModel: .constant(gameViewModel))
}
