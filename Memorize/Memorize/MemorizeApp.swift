//
//  MemorizeApp.swift
//  Memorize
//
//  Created by doss on 1/18/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame(numberOfPairsOfCards: 4, defaultTheme: .Trains)
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
