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
            Text("Memorize!").font(.largeTitle)
            gameContent.foregroundColor(.red)
            Spacer()
            themeButtons.font(.largeTitle).padding(.horizontal)
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
    
    var themeButtons: some View {
        HStack {
            trainsThemeButton
            Spacer()
            fruitThemeButton
            Spacer()
            electricityThemeButton
        }
    }
    
    var trainsThemeButton: some View {
        Button(action: {
            viewModel.changeTheme(.Trains)
        }, label: {
            VStack {
                Text("Trains!").font(.title2)
                Image(systemName: "tram")
            }
        })
    }
    
    var fruitThemeButton: some View {
        Button(action: {
            viewModel.changeTheme(.Fruit)
        }) {
            VStack {
                Text("Fruity").font(.title2)
                Image(systemName: "globe.europe.africa.fill")
            }
            
        }
    }
    var electricityThemeButton: some View {
        Button(action: {
            viewModel.changeTheme(.Electricity)
        }) {
            VStack {
                Text("Electrical").font(.title2)
                Image(systemName: "bolt.fill")
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
        let game = EmojiMemoryGame(numberOfPairsOfCards: 4, defaultTheme: .Trains)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
