//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by doss on 1/19/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    private static let trains = ["🚊","🚞","💺","🚉", "🚂", "🚆", "🚄", "🚅", "🚃", "🚇", "🚟", "🛤", "🚝", "🚋", "🚈"]
    private static let fruit = ["🍒", "🍓", "🍇", "🍎", "🍉", "🍑", "🍊", "🍋", "🍍"]
    private static let electricity = ["⚡️", "🔋", "💡", "🔌", "🎸", "🔦", "💻", "📱", "📡"]
    
    enum Theme {
        case Trains
        case Fruit
        case Electricity
    }
    
    @Published private var model: MemoryGame<String>
    @Published var selectedTheme: Theme
    let numberOfPairsOfCards: Int
    
    init(numberOfPairsOfCards: Int, defaultTheme: Theme) {
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.selectedTheme = defaultTheme
        self.model = EmojiMemoryGame.createMemoryGame(numberOfPairsOfCards: numberOfPairsOfCards, selectedTheme: defaultTheme)
    }
    
    private static func createMemoryGame(numberOfPairsOfCards: Int, selectedTheme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in getSelectedThemeArray(selectedTheme)[pairIndex] }
    }
    
    private func updateMemoryGame() {
        model = EmojiMemoryGame.createMemoryGame(numberOfPairsOfCards: self.numberOfPairsOfCards, selectedTheme: self.selectedTheme)
    }
    
    private static func getSelectedThemeArray(_ theme: Theme) -> [String] {
        switch theme {
        case .Trains:
            return trains
        case .Fruit:
            return fruit
        case .Electricity:
            return electricity
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func changeTheme(_ theme: Theme) {
        objectWillChange.send()
        selectedTheme = theme
        updateMemoryGame()
    }
}
