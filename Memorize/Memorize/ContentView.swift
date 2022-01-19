//
//  ContentView.swift
//  Memorize
//
//  Created by doss on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    var trains = ["🚊","🚞","💺","🚉", "🚂", "🚆", "🚄", "🚅", "🚃", "🚇", "🚟", "🛤", "🚝", "🚋", "🚈"]
    var fruit = ["🍒", "🍓", "🍇", "🍎", "🍉", "🍑", "🍊", "🍋", "🍍"]
    var electricity = ["⚡️", "🔋", "💡", "🔌", "🎸", "🔦", "💻", "📱", "📡"]
    @State var themeSelected = 0
    
    var emojis: [String] {
        switch themeSelected {
        case 0:
            return trains.shuffled()
        case 1:
            return fruit.shuffled()
        case 2:
            return electricity.shuffled()
        default:
            return trains
        }
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0...8], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var theme1: some View {
        Button(action: {
            themeSelected = 0
        }, label: {
            VStack {
                Text("Trains!").font(.title2)
                Image(systemName: "tram")
            }
        })
    }
    var theme2: some View {
        Button(action: {
            themeSelected = 1
        }) {
            VStack {
                Text("Fruity").font(.title2)
                Image(systemName: "globe.europe.africa.fill")
            }
            
        }
    }
    var theme3: some View {
        Button(action: {
            themeSelected = 2
        }) {
            VStack {
                Text("Electrical").font(.title2)
                Image(systemName: "bolt.fill")
            }
            
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
    }
}
