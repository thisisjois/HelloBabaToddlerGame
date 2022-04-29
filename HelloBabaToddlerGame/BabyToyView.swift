//
//  BabyToyView.swift
//  HelloBabaToddlerGame
//
//  Created by Nathania Joyce on 27/04/22.
//

import SwiftUI

struct BabyToyView: View{
    let currentToy = Toy(id: 1)
    @State var position = CGPoint(x: 100, y:100)
    
    var drag: some Gesture{
        DragGesture()
            .onChanged{state in
                position = state.location
            }
            .onEnded{state in
                position = CGPoint(x: 100, y: 100)
            }
    }
    
    var body: some View{
        DragableToy(
            toy : currentToy,
            position : position,
            gesture: drag
        )
    }
}

struct BabyToyView_Previews: PreviewProvider {
    static var previews: some View {
        BabyToyView()
    }
}

