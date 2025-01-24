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
    
    var body: some View {
        VStack {
            Text("Player 2 Score: " + String(player2Score))
            if player1Score < player2Score {
                Text("Player 1 Wins!")
            } else if player2Score < player1Score {
                Text("Player 2 Wins!")
            } else {
                Text("It's a tie!")
            }
            Text("Player 1 Score: " + String(player1Score))
        }
    }
}

#Preview {
    ScoreView(player1Score: -10, player2Score: -20)
}
