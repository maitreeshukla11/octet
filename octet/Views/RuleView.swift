//
//  RuleView.swift
//  octet
//
//  Created by Sarju Thakkar on 1/12/25.
//


import SwiftUI

struct RuleView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Overview")
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Octet is a 2-player game in which players take turns drawing cards, flipping face down cards, and strategically replacing them to form pairs, quartets, and more.")
                         
                    Text("The deck consists of 104 number cards (8 each of 0 - 12) and 4 🐙 wild cards.")
                }
                .padding(.horizontal)

                Divider()
                Text("Setup")
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 10) {
                    Text("1. After the deck is shuffled, both players are dealt 8 cards face-down, in 2 rows of 4 cards.")
                    Text("2. The remaining cards are placed in the center as the Draw Pile.")
                    Text("3. The top card is fipped from the Draw Pile to form the Discard Pile.")
                    Text("4. The arrows indicate which player's turn it is. Player 1 always starts.")
                    Text("5. On your turn, if you choose to draw from the Draw or Discard Pile, your card will be shown in the \"Card to Play\" slot.")
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    CenterSetUpView(
                        cardToBePlaced: nil,
                        deckHasCards: false,
                        discard: nil,
                        activePlayer: 1,
                        cardWidth: 90,
                        gameViewModel: .constant(GameViewModel())
                    )
                    .frame(height: 200)
                    Spacer()
                }


                Divider()

                // Playing the Game Section
                Text("Playing the Game")
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 10) {
                    Text("**1. Your Turn**: On your turn, you can either flip a face-down card on your board or draw a card from the Draw or Discard Pile.")
                    
                    Text("**2. Actions**: After choosing a card, you must do one of the following:")
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("**a. Replace a Card**: Place your \"Card To Play\" on any face-up or face-down card on your board. Once you replace a card, the card will automatically move to the top of the Discard Pile for the next player to use.")
                            .padding(.leading, 20)
                        Text("**b. Discard**: If you draw from the Draw Pile and don't want the card, place it on the Discard Pile to end your turn.")
                            .padding(.leading, 20)
                    }

                    Text("**3. 🐙 Card**: The 🐙 card is a wild card that can match the value of any other card (see Scoring below) and is the only card allowed to move within your board. If you choose to replace an 🐙 card, you may replace another card on your board with the 🐙 instead of discarding the card. The card that is replaced by the 🐙 card is then placed face-up on the Discard Pile.")

                    Text("**4. Game End**: The game ends when one player flips all their cards face-up. The other player has one last turn to play, then all remaining face-down cards are flipped over to end the game and begin scoring.")
                }
                .padding(.horizontal)

                Divider()
            
                
                Text("Scoring")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("**1. Pair**: Two matching cards in a column make the score of the column equal to 0.")
                    Text("**2. Quartet**: Four matching cards in 2 columns make the score of the 2 columns equal to -10.")
                    Text("**3. Sextet**: Six matching cards in 3 columns make the score of the 3 columns equal to -15.")
                    Text("**4. Octet**: Eight matching cards make the score equal to -20. This is the best possible score in the game!")
                    Text("**5. Unpaired Cards**: For any unpaired cards in a column, the score of the column is equal to the sum of the 2 cards.")
                    Text("**6. Final Score:** Each players's final score is summed up based on the scoring explained above. **The player with the lowest score wins!**")
                    
                         
                         
                }
                .padding(.horizontal)
                
                Text("**Pair Rules:**")
                    .font(.title3)
                    .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Valid Pairs:").font(.headline)
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: false, cardValue: "8"),
                                Card(isFaceUp: true, cardValue: "9"), Card(isFaceUp: true, cardValue: "9"),
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: false, cardValue: "4"),
                                Card(isFaceUp: false, cardValue: "5"), Card(isFaceUp: false, cardValue: "6")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: false, cardValue: "8"),
                                Card(isFaceUp: false, cardValue: "9"), Card(isFaceUp: false, cardValue: "9"),
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: false, cardValue: "4"),
                                Card(isFaceUp: true, cardValue: "🐙"), Card(isFaceUp: true, cardValue: "🐙")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: false, cardValue: "8"),
                                Card(isFaceUp: false, cardValue: "9"), Card(isFaceUp: false, cardValue: "9"),
                                Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: true, cardValue: "🐙"),
                                Card(isFaceUp: false, cardValue: "🐙"), Card(isFaceUp: false, cardValue: "🐙")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    
                    Text("Invalid Pairs:").font(.headline)
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: false, cardValue: "8"),
                                Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: false, cardValue: "9"),
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: false, cardValue: "4"),
                                Card(isFaceUp: false, cardValue: "5"), Card(isFaceUp: false, cardValue: "6")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: true, cardValue: "8"),
                                Card(isFaceUp: true, cardValue: "8"), Card(isFaceUp: false, cardValue: "9"),
                                Card(isFaceUp: false, cardValue: "3"), Card(isFaceUp: false, cardValue: "4"),
                                Card(isFaceUp: false, cardValue: "5"), Card(isFaceUp: false, cardValue: "6")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                }

                Text("**Scoring Examples:**")
                    .font(.title3)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Pair Example:").font(.headline)
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: true, cardValue: "8"),
                                Card(isFaceUp: true, cardValue: "9"), Card(isFaceUp: true, cardValue: "9"),
                                Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: true, cardValue: "4"),
                                Card(isFaceUp: true, cardValue: "5"), Card(isFaceUp: true, cardValue: "6")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    Text("Score: (3 + 8) + 0 (for pair of 9s) + (3 + 4) + (5 + 6) = 29")
                    
                    Text("Quartet Example:").font(.headline)
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: true, cardValue: "8"), Card(isFaceUp: true, cardValue: "8"),
                                Card(isFaceUp: true, cardValue: "8"), Card(isFaceUp: true, cardValue: "8"),
                                Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: true, cardValue: "4"),
                                Card(isFaceUp: true, cardValue: "5"), Card(isFaceUp: true, cardValue: "6")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    Text("Score: -10 (for quartet of 8s) + (3 + 4) + (5 + 6) = 8")

                    Text("Sextet Example:").font(.headline)
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: true, cardValue: "7"), Card(isFaceUp: true, cardValue: "7"),
                                Card(isFaceUp: true, cardValue: "🐙"), Card(isFaceUp: true, cardValue: "7"),
                                Card(isFaceUp: true, cardValue: "1"), Card(isFaceUp: true, cardValue: "2"),
                                Card(isFaceUp: true, cardValue: "7"), Card(isFaceUp: true, cardValue: "7")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    Text("Score: -15 (for sextet of 7s including 🐙) + (1 + 2) = -12")

                    Text("Octet Example:").font(.headline)
                    HStack {
                        Spacer()
                        PlayerView(
                            player: Player(playerId: 1, cards: [
                                Card(isFaceUp: true, cardValue: "4"), Card(isFaceUp: true, cardValue: "4"),
                                Card(isFaceUp: true, cardValue: "4"), Card(isFaceUp: true, cardValue: "4"),
                                Card(isFaceUp: true, cardValue: "4"), Card(isFaceUp: true, cardValue: "4"),
                                Card(isFaceUp: true, cardValue: "4"), Card(isFaceUp: true, cardValue: "4")
                            ]),
                            cardWidth: 80,
                            gameViewModel: .constant(GameViewModel())
                        )
                        Spacer()
                    }
                    Text("Score: -20 (for octet of 4s)")
                }
            }
            .padding()
        }
        .navigationTitle("Rules")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RuleView_Previews: PreviewProvider {
    static var previews: some View {
        RuleView()
    }
}
