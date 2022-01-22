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
    
    private var faceUpCardIndex: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)} }
    }
    
    private var allMatch: Bool {
        return cards.allSatisfy() { card in card.isMatched }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = faceUpCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    if allMatch {
                        cards[chosenIndex].isFaceUp = false
                        cards[potentialMatchIndex].isFaceUp = false
                    }
                }
                if (!cards[chosenIndex].isMatched && cards[chosenIndex].timesSeen > 1) {
                    score -= 1
                }
            } else {
                faceUpCardIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
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
        var isFaceUp = false
        var isMatched = false
        var timesSeen = 0
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
