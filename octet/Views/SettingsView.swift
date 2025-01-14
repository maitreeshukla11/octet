//
//  SettingsView.swift
//  octet
//
//  Created by Sarju Thakkar on 1/13/25.
//


import SwiftUI

struct SettingsView: View {
    @AppStorage("rotatePlayer2") private var rotatePlayer2 = true

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Toggle("Rotate Player 2's Cards", isOn: $rotatePlayer2)
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .padding()

            Divider()

            Text("Preview")
                .font(.title2)
                .fontWeight(.semibold)

            HStack {
                PlayerView(
                    player: Player(playerId: 2, cards: [
                        Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: true, cardValue: "8"),
                        Card(isFaceUp: true, cardValue: "9"), Card(isFaceUp: true, cardValue: "9"),
                        Card(isFaceUp: true, cardValue: "3"), Card(isFaceUp: true, cardValue: "4"),
                        Card(isFaceUp: true, cardValue: "5"), Card(isFaceUp: true, cardValue: "6")
                    ]),
                    cardWidth: 80,
                    gameViewModel: .constant(GameViewModel())
                )
            }

            Spacer()
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
