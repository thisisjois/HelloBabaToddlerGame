//
//  ContentView.swift
//  HelloBabaToddlerGame
//
//  Created by Nathania Joyce on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ToyViewModel()
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                viewModel.update(dragPosition: state.location)
            }
            .onEnded { state in
                viewModel.update(dragPosition: state.location)
                withAnimation {
                    viewModel.confirmWhereToyWasDropped()
                }
            }
    }
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: gridItems, spacing: 100) {
                ForEach(viewModel.toyContainers, id: \.id) { toy in
                    ToyContainer(
                        toy: toy,
                        viewModel: viewModel
                    )
                }
            }
            if let currentToy = viewModel.currentToy {
                DragableToy(
                    toy: currentToy,
                    position: viewModel.currentPosition,
                    gesture: drag
                )
                    .opacity(viewModel.draggableToyOpacity)
            }
        }
        .onAppear {
            viewModel.setNextToy()
        }
        .alert(
            Text("Congratulations, you won! 🎉"),
            isPresented: $viewModel.isGameOver,
            actions: {
                Button("OK") {
                    withAnimation {
                        viewModel.generateNewGame()
                    }
                }
            },
            message: {
                Text("Number of attemps: \(viewModel.attempts)")
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
