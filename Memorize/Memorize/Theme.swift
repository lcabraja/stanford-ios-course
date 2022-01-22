//
//  Theme.swift
//  Memorize
//
//  Created by doss on 1/21/22.
//

import Foundation
import SwiftUI

struct ThemeContents {
    let numberOfPairsOfCards: Int
    let emojis: [String]
    let color: Color
}

enum Theme: String, CaseIterable {
    case Trains
    case Fruits
    case Electricity
    case White
    case Shapes
    case DisneyFamilies = "Disney Families"
    
    var content: ThemeContents {
        switch self {
        case .Trains:
            return ThemeContents(
                numberOfPairsOfCards: 12,
                emojis: ["🚊","🚞","💺","🚉", "🚂", "🚆", "🚄", "🚅", "🚃", "🚇", "🚟", "🛤", "🚝", "🚋", "🚈"].shuffled(),
                color: .blue
            )
        case .Fruits:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis: ["🍒", "🍓", "🍇", "🍎", "🍉", "🍑", "🍊", "🍋", "🍍"].shuffled(),
                color: .red
            )
        case .Electricity:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis:  ["⚡️", "🔋", "💡", "🔌", "🎸", "🔦", "💻", "📱", "📡"].shuffled(),
                color: .blue
            )
        case .White:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis:  ["🐶","🕊","🐼","🐓","🦷","🥥","🐑","👻"].shuffled(),
                color: .white
            )
            
        case .Shapes:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis:  ["🌙","🔴","⚫️","🔵","⬛️","🔷","🟦","💝"].shuffled(),
                color: .gray
            )
            
        case .DisneyFamilies:
            return ThemeContents(
                numberOfPairsOfCards: 10,
                emojis:  ["👨‍👧","🧍‍♀️","🧍","👨‍👦","👨‍👨‍👦","👨‍👨‍👦‍👦","👪","👨‍👧‍👦","👨‍👨‍👧","👧"].shuffled(),
                color: .purple
            )
        }
    }
}
