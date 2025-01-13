//
//  HomePageView.swift
//  octet
//
//  Created by Sarju Thakkar on 1/12/25.
//

import SwiftUI

struct HomePageView: View {
    @Binding var gameViewModel: GameViewModel // Receive as Binding

    var body: some View {
        VStack(spacing: 40) { // Adjust spacing as needed
            Spacer()
            
            Text("🐙ctet")
                .font(.system(size: 96))
                .fontWeight(.bold)
            
            Spacer()
            
            // Navigation Link to GameView
            NavigationLink(destination: GameView(gameViewModel: $gameViewModel)) {
                Text("Play")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
            
            // Navigation Link to RuleView
            NavigationLink(destination: RuleView()) {
                Text("Rules")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
        }
        .navigationBarHidden(true) // Hide the navigation bar on Home Page
    }
}

#Preview {
    var gameViewModel: GameViewModel = GameViewModel()
    HomePageView(gameViewModel: .constant(gameViewModel))
}

