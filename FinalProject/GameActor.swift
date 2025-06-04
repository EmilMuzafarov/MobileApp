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

struct GameActor {
    
}

struct GameActorView: View {
    var actor: GameActor
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GameActorView(actor: GameActor())
}
