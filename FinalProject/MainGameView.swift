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
            ZStack {
                
                Image("mainGameBackground")
                    .resizable()
                    .scaledToFill()
                VStack {
                    VStack {
                        
                        HStack(alignment: .top) {
                            
                            ZStack {
                                Text("Current Floor:")
                                
                                    .bold()
                                    .font(.system(size: 20))
                                Text(model.player.buildingYPos != 0 ? String(model.player.buildingYPos) : "B")
                                    .offset(x: 0, y: 36)
                                    .bold()
                                    .font(.system(size: 50))
                            }
                            .padding()
                            Spacer()
                            //.offset(x:-130, y:-95)
                            GameControlButton(buttonType: ButtonConstants.ButtonType.TO_DO_BUTTON) {
                                showTask = true
                            }
                            .offset(x:0, y:0)
                            .padding(10)
                        }
                        .offset(x: 0, y: -70)
                        
                        GameView()
                            .scaleEffect(1.25)
                            .offset(x: 3, y: -24)
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
                        .disabled(!model.buttonUsable)
                    }
                    .padding(10)
                }
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
