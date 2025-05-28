//
//  ContentView.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI

struct MainGameView: View {
    var body: some View {
        VStack {
            Button() {
                //TaskView()
            } label: {
                GameControlButton(buttonType: ButtonConstants.ButtonType.TO_DO_BUTTON) {
                    
                }
                    
            }
            .offset(x:150, y:-50)
            GameView()
            HStack {
                HStack(spacing: 0.0) {
                    GameControlButton(buttonType: ButtonConstants.ButtonType.MOVE_PLAYER_LEFT) {
                        
                    }
                    GameControlButton(buttonType: ButtonConstants.ButtonType.MOVE_PLAYER_RIGHT) {
                        
                    }
//                    Button() {
//                        print("LEFT")
//                    } label: {
//                        Image("directionButton")
//                            .interpolation(.none)
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                    }
//                    Button() {
//                        print("RIGHT")
//                    } label: {
//                        Image("directionButton")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                    }
                }
                Spacer()
                GameControlButton(buttonType: ButtonConstants.ButtonType.PLAYER_INTERACT) {
                    
                }
            }
        }
        .padding(0)
    }
}

#Preview {
    MainGameView()
        .environmentObject(GameModel())
}
