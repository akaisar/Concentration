//
//  Card.swift
//  ConcentrationKZ
//
//  Created by Kaysar Altynbek on 10/21/20.
//

import Foundation

struct Card: Hashable
{
    
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var idetifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        Card.idetifierFactory += 1
        return Card.idetifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
