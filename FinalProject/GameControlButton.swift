//
//  GameControlButton.swift
//  FinalProject
//
//  Created by Student on 5/28/25.
//

import SwiftUI

struct ButtonConstants {
    enum ButtonType: Int, CaseIterable {
        case MOVE_PLAYER_LEFT
        case MOVE_PLAYER_RIGHT
        case PLAYER_INTERACT
        case TO_DO_BUTTON
    }
    
    static let buttonPaths: Dictionary = [
        ButtonType.MOVE_PLAYER_LEFT : "directionButton",
        ButtonType.MOVE_PLAYER_RIGHT : "directionButton",
        ButtonType.PLAYER_INTERACT : "useButton",
        ButtonType.TO_DO_BUTTON : "taskButton",
    ]
    
    static let buttonSizes: Dictionary = [
        ButtonType.MOVE_PLAYER_LEFT : CGSize(width: 150, height: 150),
        ButtonType.MOVE_PLAYER_RIGHT : CGSize(width: 150, height: 150),
        ButtonType.PLAYER_INTERACT : CGSize(width: 175, height: 175),
        ButtonType.TO_DO_BUTTON : CGSize(width: 100, height: 100),
    ]

}



struct GameControlButton: View {
    var buttonType: ButtonConstants.ButtonType
    var action: ()->Void
    var body: some View {
        Button() {
            action()
        } label: {
            Image(ButtonConstants.buttonPaths[buttonType] ?? "directionButton")
                // removes the blurry effect from small sprites
                .interpolation(.none)
                .resizable()
                // size
                .frame(width: ButtonConstants.buttonSizes[buttonType]?.width, height: ButtonConstants.buttonSizes[buttonType]?.height)
                // turning the direction button sideways
                .rotationEffect(isDirectionButton(buttonType: buttonType) ? Angle(degrees: -90) : Angle(degrees: 0))
                // flipping for right direction button
                .scaleEffect(x: (buttonType == ButtonConstants.ButtonType.MOVE_PLAYER_RIGHT ? -1.0 : 1.0), y: 1.0)
        }
        .padding(0.0)
    }
    
    func isDirectionButton(buttonType: ButtonConstants.ButtonType) -> Bool {
        return buttonType == ButtonConstants.ButtonType.MOVE_PLAYER_LEFT || buttonType == ButtonConstants.ButtonType.MOVE_PLAYER_RIGHT
    }
}

#Preview {
    VStack {
        ForEach(ButtonConstants.ButtonType.allCases, id: \.rawValue) { buttonCase in
            GameControlButton(buttonType: buttonCase) {
                
            }
        }
        
    }
}
