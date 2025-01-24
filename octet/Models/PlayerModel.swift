//
//  PlayerModel.swift
//  octet
//
//  Created by Maitree Shukla on 1/7/25.
//

import Foundation

struct Player {
    private(set) var playerId: Int
    private(set) var cards: [[Card]]
    //var score: Int
    
    init(playerId: Int, cards: [Card]) {
        self.playerId = playerId
        self.cards = []
        
        for i in 0..<4 {
            let startIndex = i * 2
            let endIndex = startIndex + 2
            let subset = Array(cards[startIndex..<endIndex])
            self.cards.append(subset)
        }
    }
    
    mutating func makeFaceUp(column: Int, row: Int) {
        self.cards[column][row].makeFaceUp()
    }
    
    mutating func replaceCard(cardToBePlaced: Card, column: Int, row: Int) -> Card {
        let cardToBeReplaced = self.cards[column][row]
        self.cards[column][row] = cardToBePlaced
        return cardToBeReplaced
    }
    
    func isCardFaceDown(column: Int, row: Int) -> Bool {
        return !self.cards[column][row].isFaceUp
    }
    
    func areAllCardsFaceUp() -> Bool {
        for column in self.cards {
            for card in column {
                if !card.isFaceUp {
                    return false
                }
            }
        }
        return true
    }
    
    mutating func flipAllCardsFaceUp() {
        for column in 0...3 {
            for row in 0...1 {
                self.cards[column][row].makeFaceUp()
            }
        }
    }
    
    func computeScore() -> Int {
        var score = 0
        var frequencyOfPairs: [Int: Int] = [:]
        var octopusPairs = 0
        
        for column in cards {
            let firstCardInColumn = column[0]
            let secondCardInColumn = column[1]
            
            if isOctopusPair(firstCardInColumn, secondCardInColumn) {
                octopusPairs += 1
            }
            else if let pairValue = getPairValue(firstCardInColumn, secondCardInColumn) {
                frequencyOfPairs[pairValue, default: 0] += 1
            }
            else {
                score += firstCardInColumn.numericValue() + secondCardInColumn.numericValue()
            }
        }

        if octopusPairs > 0 {
            if frequencyOfPairs.isEmpty {
                frequencyOfPairs[-1] = octopusPairs
            } else {
                var numericValueWithMostPairs: Int? = nil
                var numberOfPairs = 0
                
                for (key, value) in frequencyOfPairs {
                    if value > numberOfPairs {
                        numberOfPairs = value
                        numericValueWithMostPairs = key
                    }
                }
                
                frequencyOfPairs[numericValueWithMostPairs!] = numberOfPairs + octopusPairs
            }
        }

        
        for (_, count) in frequencyOfPairs {
            switch count {
            case 1:  score += 0
            case 2:  score += -10
            case 3:  score += -25
            case 4:  score += -30
            default:
                score += 0
            }
        }
        
        return score
    }
    
    private func isOctopusPair(_ firstCardInColumn : Card, _ secondCardInColumn: Card) -> Bool {
        return firstCardInColumn.isOctopus() && secondCardInColumn.isOctopus()
    }

    private func getPairValue(_ firstCardInColumn : Card, _ secondCardInColumn: Card) -> Int? {
        if firstCardInColumn.isOctopus() && !secondCardInColumn.isOctopus() { return secondCardInColumn.numericValue() }
        if secondCardInColumn.isOctopus() && !firstCardInColumn.isOctopus() { return firstCardInColumn.numericValue() }
        
        if firstCardInColumn.numericValue() == secondCardInColumn.numericValue() {
            return firstCardInColumn.numericValue()
        }
    
        return nil
    }
    
}
