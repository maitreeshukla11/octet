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
                Text("🐙ctet Rules")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                Text("Objective")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 10)

                Text("Have the lowest score at the end of the round. Players add up the values of their cards at the end of the round to determine their scores.")
                    .font(.body)
                    .padding(.horizontal)
                
                Divider()
                
                Text("Cards")
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 10) {
                    Text("The deck consists of 104 number cards (8 each of 0 - 12) and 4 🐙 wild cards")
                }
                .padding(.horizontal)

                Divider()
                Text("Setup")
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Shuffle the deck and deal 8 cards facedown to each player, in 4 columns of 2 cards.")
                    Text("2. Place the remaining cards in the center as the Draw Pile.")
                    Text("3. Flip the top card from the Draw Pile to form the Discard Pile.")
                    Text("4. The arrows indicate which player's turn it is.")
                    Text("5. On your turn, if you choose to draw from the draw or discard pile, your card will be shown in the \"Card to Play\" slot.")
                }
                .padding(.horizontal)

                CenterSetUpView(
                    cardToBePlaced: nil,
                    deckHasCards: false,
                    discard: nil,
                    activePlayer: 1,
                    cardWidth: 90,
                    gameViewModel: .constant(GameViewModel())
                )
                .frame(height: 200)

                Divider()

                // Playing the Game Section
                Text("Playing the Game")
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack(alignment: .leading, spacing: 10) {
                    Text("1. **Your Turn**: On your turn, you can either flip a card or draw a card from the Draw or Discard Pile.")
                    
                    Text("2. **Actions**: After choosing a card, you must do one of the following:")
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("   a. **Replace a Card**: Place the chosen card face-up and move the replaced card to the Discard Pile face-up.")
                        Text("   b. **Discard**: If you draw from the Draw Pile and don't want the card, place it on the Discard Pile to end your turn.")
                    }

                    Text("3. **🐙 Card**: The 🐙 is a wild card that can replace any card in your Box. If you draw a card that matches the other card in a 🐙’s column, you can replace the 🐙 and move it to another column.")

                    Text("4. **Round End**: The round ends when one player flips all their cards face-up. The other player finishes one more turn, then flips their remaining cards face-up.")
                }
                .padding(.horizontal)

                Divider()

                Text("Scoring")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Add up all unpaired numbers on your cards to calculate your score.")
                    Text("2. **Pair**: Two matching cards in a column form a pair and do not count against your score.")
                    Text("3. **Quartet**: Four matching cards in 2 columns reduce your score by 10 points.")
                    Text("4. **Sextet**: Six matching cards in 3 columns reduce your score by 15 points.")
                    Text("5. **Octet**: Eight matching cards reduce your score by 20 points.")
                }
                .padding(.horizontal)
                
                Text("Pair Rules:")
                    .font(.headline)
                    .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Valid Pairs:")
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
                    
                    Text("Invalid Pairs:")
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
                }

                Text("Scoring Examples:")
                    .font(.headline)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Pair Example:")
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
                    Text("Score: 3 + 8 + 0 (for pair of 9s) + 3 + 4 + 5 + 6 = 29")
                    
                    Text("Quartet Example:")
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
                    Text("Score: -10 (for quartet of 8s) + 3 + 4 + 5 + 6 = 8")

                    Text("Sextet Example:")
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
                    Text("Score: -15 (for sextet of 7s including 🐙) + 1 + 2 = -12")

                    Text("Octet Example:")
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
                    Text("Score: -20 (for octet of 4s) = -26")
                }
                .padding(.horizontal)

                Divider()

                Text("Winning the Game")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 10)

                Text("The player with the lowest score wins the game.")
                    .font(.body)
                    .padding(.horizontal)
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
