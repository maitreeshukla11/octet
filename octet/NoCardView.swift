//
//  NoCardView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct NoCardView: View {
    var noCardText: String = "Discard Pile"
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [10]))
            GeometryReader { card in
                Text(noCardText)
                    .font(.system(size: min(card.size.width, card.size.height) * 0.2))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .frame(width: card.size.width, height: card.size.height)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

#Preview {
    NoCardView()
        .frame(width: 100)
}
