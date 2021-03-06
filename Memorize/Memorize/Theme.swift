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
                emojis: ["๐","๐","๐บ","๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ค", "๐", "๐", "๐"].shuffled(),
                color: .blue
            )
        case .Fruits:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis: ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐"].shuffled(),
                color: .red
            )
        case .Electricity:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis:  ["โก๏ธ", "๐", "๐ก", "๐", "๐ธ", "๐ฆ", "๐ป", "๐ฑ", "๐ก"].shuffled(),
                color: .blue
            )
        case .White:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis:  ["๐ถ","๐","๐ผ","๐","๐ฆท","๐ฅฅ","๐","๐ป"].shuffled(),
                color: .white
            )
            
        case .Shapes:
            return ThemeContents(
                numberOfPairsOfCards: 8,
                emojis:  ["๐","๐ด","โซ๏ธ","๐ต","โฌ๏ธ","๐ท","๐ฆ","๐"].shuffled(),
                color: .gray
            )
            
        case .DisneyFamilies:
            return ThemeContents(
                numberOfPairsOfCards: 10,
                emojis:  ["๐จโ๐ง","๐งโโ๏ธ","๐ง","๐จโ๐ฆ","๐จโ๐จโ๐ฆ","๐จโ๐จโ๐ฆโ๐ฆ","๐ช","๐จโ๐งโ๐ฆ","๐จโ๐จโ๐ง","๐ง"].shuffled(),
                color: .purple
            )
        }
    }
}
