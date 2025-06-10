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
    static let systemImageDict: Dictionary = [
        ActorType.PLAYER : "person.fill",
        ActorType.HALL_MONITOR : "pencil",
    ]
    
    static let animImageDict: Dictionary<ActorType, [String]> = [
        ActorType.PLAYER : ["standingBeaver", "walkingBeaver"],
        ActorType.HALL_MONITOR : ["lockerDoor"],
    ]

    var buildingXPos: Int
    var buildingYPos: Int
    var facing: ActorFaceDirection
    var type: ActorType
    var actorPhase: Int = 0
    
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
        Image(GameActor.animImageDict[actor.type]?[actor.actorPhase % (GameActor.animImageDict[actor.type]?.count ?? 0)] ?? "heart.fill")
            .interpolation(.none)
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
