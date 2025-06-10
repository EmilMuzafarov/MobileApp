//
//  GameActor.swift
//  FinalProject
//
//  Created by Student on 5/29/25.
//

import SwiftUI

enum ActorType {
    case PLAYER
    case HALL_MONITOR
}

enum ActorFaceDirection: Int {
    case NONE
    case LEFT
    case RIGHT
}

@Observable class GameActor: Identifiable {
    static let imageDict: Dictionary = [
        ActorType.PLAYER : "person.fill",
        ActorType.HALL_MONITOR : "pencil",
    ]

    var buildingXPos: Int
    var buildingYPos: Int
    var facing: ActorFaceDirection
    var type: ActorType
    
    init(buildingXPos: Int, buildingYPos: Int, facing: ActorFaceDirection, type: ActorType) {
        self.buildingXPos = buildingXPos
        self.buildingYPos = buildingYPos
        self.facing = facing
        self.type = type
    }
    
}

struct GameActorView: View {
    @State var actor: GameActor
    var color: Color {
            actor.type == .PLAYER ? .red : .black
        }
    var body: some View {
        Image(systemName: GameActor.imageDict[actor.type] ?? "heart.fill")
                .resizable()
                .frame(width: 32, height: 32)
                // flipping for right direction button
                .scaleEffect(x: (actor.facing == ActorFaceDirection.LEFT ? -1.0 : 1.0), y: 1.0)
                .padding(0)
                .foregroundColor(Color.blue)
                //.foregroundColor(color)
    }
}

#Preview {
    GameActorView(actor: GameActor(buildingXPos: 0, buildingYPos: 0, facing: ActorFaceDirection.RIGHT, type: ActorType.PLAYER))
}
