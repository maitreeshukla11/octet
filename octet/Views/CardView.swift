//
//  CardView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(card.isFaceUp ? Color.white : Constants.skyBlueColor)
                .strokeBorder(lineWidth: Constants.lineWidth)
                .shadow(radius: Constants.shadowRadius)
            
            if card.isFaceUp {
                Text(card.cardValue)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.inset)
            }
        }
        .aspectRatio(Constants.aspectRatio, contentMode: .fit)
    }
    
    private struct Constants {
        static let skyBlueColor = Color(red: 0.53, green: 0.81, blue: 0.92)
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 1
        static let shadowRadius: CGFloat = 5
        static let aspectRatio: CGFloat = 2/3
        static let inset: CGFloat = 6
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        
    }
}
    
    
    
    
    
#Preview {
    var isFaceUp: Bool = true
    var cardValue: String = "10"
    var card = Card(isFaceUp: isFaceUp, cardValue: cardValue)
    CardView(card: card)
        .frame(width: 100)
}

