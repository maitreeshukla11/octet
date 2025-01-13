//
//  CenterSetUpView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct CenterSetUpView: View {
    var cardToBePlaced: Card?
    var deckHasCards: Bool
    var discard: Card?
    var activePlayer: Int?
    
    var cardWidth: CGFloat
    
    @Binding var gameViewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: Constants.triangleSpacing) {
            Triangle()
                .fill(activePlayer == 2 ? Color.green : Color.gray)
                .frame(width: Constants.triangleDimension, height: Constants.triangleDimension)
            HStack(spacing: Constants.cardSpacing) {
                Group {
                    if cardToBePlaced != nil {
                        CardView(card: cardToBePlaced!)
                            .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 4)
                                .shadow(color: .green, radius: 5)
                            )
                            .frame(width: cardWidth)
                    } else {
                        NoCardView(noCardText: "Card to Play")
                    }
                    
                    if deckHasCards {
                        CardView(card: Card(isFaceUp: false, cardValue: "Doesn't Matter"))
                            .onTapGesture {
                                gameViewModel.tapDeck()
                            }
                    } else {
                        NoCardView(noCardText: "Draw Pile")
                    }
                    
                    if discard != nil {
                        CardView(card: discard!)
                            .onTapGesture {
                                gameViewModel.tapDiscardCard()
                            }
                    } else {
                        NoCardView(noCardText: "Discard Pile")
                    }
                }
                .rotationEffect(.degrees(activePlayer == 2 ? 180 : 0))
                .frame(width: cardWidth)
            }
            Triangle()
                .fill(activePlayer == 1 ? Color.green : Color.gray)
                .rotationEffect(.degrees(180))
                .frame(width: Constants.triangleDimension, height: Constants.triangleDimension)
        }
    }
    
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
            return path
        }
    }
    
    private struct Constants {
        static let triangleDimension: CGFloat = 20
        static let triangleSpacing: CGFloat = 15
        static let cardSpacing: CGFloat = 20
    }
}

#Preview {
    var gameViewModel: GameViewModel = GameViewModel()
    CenterSetUpView(deckHasCards: true, activePlayer: nil, cardWidth: 90, gameViewModel: .constant(gameViewModel))
}
