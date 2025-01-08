//
//  CenterSetUpView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct CenterSetUpView: View {
    var cardToBePlacedValue: String?
    var drawPile: [String]
    var discard: [String]
    var playerTurn: Int
    
    var cardWidth: CGFloat
    
    var body: some View {
        let discardTop = discard.last
        let drawPileTop = drawPile.last

        VStack(spacing: Constants.triangleSpacing) {
            Triangle()
                .fill(playerTurn == 2 ? Color.green : Color.gray)
                .frame(width: Constants.triangleDimension, height: Constants.triangleDimension)
            HStack(spacing: Constants.cardSpacing) {
                Group {
                    if cardToBePlacedValue != nil {
                        CardView(isFaceUp: true, cardValue: cardToBePlacedValue!)
                    } else {
                        NoCardView(noCardText: "Card to Play")
                    }
                    
                    if drawPileTop != nil {
                        CardView(isFaceUp: false, cardValue: drawPileTop!)
                    } else {
                        NoCardView(noCardText: "Draw Pile")
                    }
                    
                    if discardTop != nil {
                        CardView(isFaceUp: true, cardValue: discardTop!)
                    } else {
                        NoCardView(noCardText: "Discard Pile")
                    }
                }
                .rotationEffect(.degrees(playerTurn == 1 ? 0 : 180))
                .frame(width: cardWidth)
            }
            Triangle()
                .fill(playerTurn == 1 ? Color.green : Color.gray)
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
    var cardToBePlacedValue: String?
    var drawPile: [String] = ["1", "2", "3"]
    var discard: [String] = ["1", "2", "3"]
    var playerTurn: Int = 1
    var cardWidth: CGFloat = 90
    CenterSetUpView(cardToBePlacedValue: cardToBePlacedValue, drawPile: drawPile, discard: discard, playerTurn: playerTurn, cardWidth: cardWidth)
}
