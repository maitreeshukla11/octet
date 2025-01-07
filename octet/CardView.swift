//
//  CardView.swift
//  octet
//
//  Created by Maitree Shukla on 1/6/25.
//

import SwiftUI

struct CardView: View {
    var isFaceUp: Bool = false
    var cardValue: String = "0"
    
    private let skyBlueColor = Color(red: 0.53, green: 0.81, blue: 0.92)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isFaceUp ? Color.white : skyBlueColor)
                .strokeBorder(lineWidth: 1)
                .shadow(radius: 5)
              
            
            if isFaceUp {
                Text(cardValue)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}


#Preview {
    CardView()
        .frame(width: 100)
}
