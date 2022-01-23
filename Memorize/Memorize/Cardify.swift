//
//  Cardify.swift
//  Memorize
//
//  Created by doss on 1/22/22.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var isFaceUp: Bool
    var isMatched: Bool
    
    init(isFaceUp: Bool, isMatched: Bool) {
        rotation = isFaceUp ? 0 : 180
        self.isFaceUp = isFaceUp
        self.isMatched = isMatched
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double // in degrees
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90 {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                content
            }
            else {
                shape.fill()
            }
            //            } else {
            //                shape.stroke()
            //            }
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool, isMatched: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isMatched: isMatched))
    }
}
