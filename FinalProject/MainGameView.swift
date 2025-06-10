//
//  ContentView.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI
let tasks: [String] = ["Homework", "Attendance"]
var completed = 0
var total = tasks.count
struct MainGameView: View {
    @Environment(GameModel.self) var model: GameModel
    @State private var showTask = false
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    GameControlButton(buttonType: ButtonConstants.ButtonType.TO_DO_BUTTON) {
                        showTask = true
                    }
                    .offset(x:150, y:-50)
                    .padding(10)
                    GameView()
                        .scaleEffect(1.25)
                }
                .padding(.bottom, 50)
                HStack {
                    HStack(spacing: 5.0) {
                        GameControlButton(buttonType: ButtonConstants.ButtonType.MOVE_PLAYER_LEFT) {
                            model.movePlayer(dir: -1)
                        }
                        GameControlButton(buttonType: ButtonConstants.ButtonType.MOVE_PLAYER_RIGHT) {
                            model.movePlayer(dir: 1)
                        }
                    }
                    .padding(5)
                    Spacer()
                    GameControlButton(buttonType: ButtonConstants.ButtonType.PLAYER_INTERACT) {
                        model.playerInteract()
                    }
                        .opacity(model.buttonUsable ? 1.0 : 0.25)
                        .padding(10)
                    }
                .padding(10)
            }
            .navigationDestination(isPresented: $showTask) {
                TaskView()
            }
        }
    }
}

#Preview {
    MainGameView()
        .environment(GameModel())
}
