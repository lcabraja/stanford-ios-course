//
//  MemoryGame.swift
//  Memorize
//
//  Created by doss on 1/19/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private (set) var cards: [Card]
    private (set) var score: Int = 0
    
    private var faceUpCardIndex: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = faceUpCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                faceUpCardIndex = nil
                if (!cards[chosenIndex].isMatched && cards[chosenIndex].timesSeen > 1) {
                    score -= 1
                }
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                faceUpCardIndex = chosenIndex
                
            }
            cards[chosenIndex].isFaceUp.toggle()
            cards[chosenIndex].timesSeen += 1
            
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex * 2))
            cards.append(Card(content: cardContent, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var timesSeen: Int = 0
        
        var id: Int
    }
}
