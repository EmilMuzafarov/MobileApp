//
//  ContentView.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI
var fromTile: [Tile] = []
var toTile: [Tile] = []
let tasks: [String] = ["Deliver a note from locker 2 to classroom 6", "Bring Attendance from classroom 5 to the 1st floor locker", "Bring supplies from locker 5 to classroom 2", "Take the gym clothes from the basement locker to classroom 7", "Take handouts from locker 4 to classroom 8"]
var completed = 0
var total = tasks.count
struct MainGameView: View {
    @Environment(GameModel.self) var model: GameModel
    @State private var showTask = false
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                                HStack {
                                    ZStack {
                                        Text("Current Floor:")
                                            .offset(x: 0, y: 13)
                                            .bold()
                                            .font(.system(size: 20))
                                        Text(model.player.buildingYPos != 0 ? String(model.player.buildingYPos) : "B")
                                            .offset(x: 0, y: 43)
                                            .bold()
                                            .font(.system(size: 50))
                                    }
                                    .padding()
                                    
                                    ZStack {
                                        Text("Time Left:")
                                            .offset(x: 0, y: 13)
                                            .bold()
                                            .font(.system(size: 20))
                                        
                                        Text("\(timeRemaining)")
                                            .offset(x: 0, y: 43)
                                            .bold()
                                            .font(.system(size: 50))
                                    }
                                }
                            }
                            
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
                            .offset(x: 3, y: -36)
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
                TaskListView()
            }
        }
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                
            }
        }
    }
}

#Preview {
    MainGameView()
        .environment(GameModel())
}
