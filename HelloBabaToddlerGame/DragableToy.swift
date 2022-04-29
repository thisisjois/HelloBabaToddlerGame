//
//  DragableToy.swift
//  HelloBabaToddlerGame
//
//  Created by Nathania Joyce on 27/04/22.
//

import SwiftUI

struct DragableToy<Dragable: Gesture>: View {
    let toy: Toy
    let position: CGPoint
    let gesture: Dragable
    private let size: CGFloat = 100
    
    var body: some View {
        Circle()
            .fill(toy.color)
            .frame(width: size, height: size)
            .shadow(radius: 10)
            .position(position)
            .gesture(gesture)
    }
}

struct DragableToy_Previews: PreviewProvider {
    static var previews: some View {
        DragableToy(
            toy: Toy.all.first!,
            position: .zero,
            gesture: DragGesture()
        )
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

