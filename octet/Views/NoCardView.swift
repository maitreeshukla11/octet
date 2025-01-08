//
//  NoCardView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct NoCardView: View {
    var noCardText: String
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.white)
                .strokeBorder(style: StrokeStyle(lineWidth: Constants.lineWidth, dash: [Constants.dash]))
            GeometryReader { card in
                Text(noCardText)
                    .font(.system(size: card.size.width * Constants.fontRatio))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(Constants.scaleFactor)
                    .frame(width: card.size.width, height: card.size.height)
            }
        }
        .aspectRatio(Constants.aspectRatio, contentMode: .fit)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 1
        static let dash: CGFloat = 10
        static let scaleFactor: CGFloat = 0.5
        static let fontRatio: CGFloat = 1/5
        static let aspectRatio: CGFloat = 2/3
    }
}

#Preview {
    var noCardText: String = "Discard Pile"
    NoCardView(noCardText: noCardText)
        .frame(width: 100)
}
