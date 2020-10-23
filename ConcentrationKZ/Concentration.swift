//
//  Concentration.swift
//  ConcentrationKZ
//
//  Created by Kaysar Altynbek on 10/21/20.
//

import Foundation

class Concentration
{
    private(set) var cards = Array<Card>()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{           
        get {
            var foundIndex: Int? = nil
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int){
        assert(numberOfPairOfCards > 0, "Concentration.init(\(numberOfPairOfCards): you must have at least one pair of cards")
        for _ in 1...numberOfPairOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
