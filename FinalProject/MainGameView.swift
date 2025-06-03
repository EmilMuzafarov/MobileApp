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
        VStack {
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
        }
    }
}

#Preview {
    MainGameView()
        .environmentObject(GameModel())
}
