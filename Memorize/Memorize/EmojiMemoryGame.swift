//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by doss on 1/19/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private var model: MemoryGame<String>
    var selectedTheme: Theme
    
    init() {
        self.selectedTheme = Theme.allCases.randomElement()!
        self.model = MemoryGame<String>(
            numberOfPairsOfCards: selectedTheme.content.numberOfPairsOfCards,
            createCardContent: EmojiMemoryGame.createMemoryGame(self.selectedTheme.content.emojis)
        )
    }
    
    private static func createMemoryGame(_ content: [String]) -> ((Int) -> String) {
        return { pairIndex in
            content[pairIndex]
        }
    }
    
    var cards: [Card] {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: - intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func changeTheme(_ theme: Theme) {
        objectWillChange.send()
        selectedTheme = theme
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        self.selectedTheme = Theme.allCases.randomElement()!
        model = MemoryGame<String>(
            numberOfPairsOfCards: selectedTheme.content.numberOfPairsOfCards,
            createCardContent: EmojiMemoryGame.createMemoryGame(self.selectedTheme.content.emojis)
        )
    }
}
