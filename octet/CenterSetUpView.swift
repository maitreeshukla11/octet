//
//  CenterSetUpView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

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

struct CenterSetUpView: View {
    var cardToBePlacedValue: String?
    var drawPile: [String] = ["1", "2", "3"]
    var discard: [String] = ["1", "2", "3"]
    var playerTurn: Int = 1
    var cardWidth: CGFloat = 90
    
    var body: some View {
        let discardTop = discard.last
        let drawPileTop = drawPile.last

        VStack(spacing: 15) {
            Triangle()
                .fill(playerTurn == 2 ? Color.green : Color.gray)
                .frame(width: 20, height: 20)
            HStack(spacing: 20) {
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
                .frame(width: 20, height: 20)
        }
        .padding(10)
    }
}

#Preview {
    CenterSetUpView()
}
