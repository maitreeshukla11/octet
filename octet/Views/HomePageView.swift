//
//  HomePageView.swift
//  octet
//
//  Created by Sarju Thakkar on 1/12/25.
//

import SwiftUI

struct HomePageView: View {
    @Binding var gameViewModel: GameViewModel
    @Binding var navigationPath: [OctetScreen]

    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            Text("🐙ctet")
                .font(.system(size: 96))
                .fontWeight(.bold)

            Spacer()

            Button(action: {
                navigationPath.append(.game)
            }) {
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

            Button(action: {
                navigationPath.append(.rules)
            }) {
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

            Button(action: {
                navigationPath.append(.settings)
            }) {
                Text("Settings")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }

            Spacer()
        }
    }
}


#Preview {
    var gameViewModel: GameViewModel = GameViewModel()
    NavigationStack { // Embed in NavigationStack to simulate navigation
        HomePageView(gameViewModel: .constant(gameViewModel), navigationPath: .constant([]))
    }
}
