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
                .fill(card.isFaceUp ? Color.white : Constants.ceruleanColor)
                .strokeBorder(lineWidth: Constants.lineWidth)
                .shadow(radius: Constants.shadowRadius)
            
            if card.isFaceUp {
                Text(card.cardValue)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.inset)
                    .underline(card.cardValue == "6" || card.cardValue == "9")
            }
        }
        .aspectRatio(Constants.aspectRatio, contentMode: .fit)
    }
    
    private struct Constants {
        static let ceruleanColor = Color(red: 0.17, green: 0.67, blue: 0.98)
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
    var cardValue: String = "6"
    var card = Card(isFaceUp: isFaceUp, cardValue: cardValue)
    CardView(card: card)
        .frame(width: 100)
}

