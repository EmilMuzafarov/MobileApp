//
//  ContentView.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI
let tasks: [String] = ["Homework", "Attendance"]
var completed = 0
struct MainGameView: View {
    @State private var showTask = false
    var body: some View {
        NavigationStack {
            VStack {
                GameControlButton(buttonType: ButtonConstants.ButtonType.TO_DO_BUTTON) {
                    showTask = true
                }
                .offset(x:150, y:-50)
                
                GameView()
                HStack {
                    HStack(spacing: 0.0) {
                        GameControlButton(buttonType: ButtonConstants.ButtonType.MOVE_PLAYER_LEFT) {
                            
                        }
                        GameControlButton(buttonType: ButtonConstants.ButtonType.MOVE_PLAYER_RIGHT) {
                            
                        }
                    }
                    Spacer()
                    GameControlButton(buttonType: ButtonConstants.ButtonType.PLAYER_INTERACT) {
                        
                    }
                }
                .padding(0)
            }
            .navigationDestination(isPresented: $showTask) {
                TaskView()
            }
        }
    }
}

#Preview {
    MainGameView()
        .environmentObject(GameModel())
}
