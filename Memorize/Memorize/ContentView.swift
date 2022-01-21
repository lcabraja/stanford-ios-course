//
//  ContentView.swift
//  Memorize
//
//  Created by doss on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.selectedTheme.rawValue)
                .foregroundColor(viewModel.selectedTheme.content.color)
                .font(.largeTitle)
            gameContent.foregroundColor(viewModel.selectedTheme.content.color)
            Spacer()
            Text("Score \(viewModel.score)").font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var gameContent: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.stroke()
            }
            else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
