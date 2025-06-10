//
//  GameView.swift
//  FinalProject
//
//  Created by Student on 5/27/25.
//

import SwiftUI

struct GameView: View {
    @Environment(GameModel.self) var model: GameModel
    let floorSpacing: CGFloat = 6.1
    var body: some View {
        ZStack {
            VStack(spacing: floorSpacing){
                ForEach(0 ..< model.rows, id:\.self) { a in
                    HStack(spacing: 6) {
                        ForEach(0 ..< model.columns, id:\.self) { b in
                            TileView(tile: model.buildingGrid[a][b])
                                .padding(0)
                        }
                    }
                    .padding(0)
                }
            }
            ForEach(model.actorList) { actor in
                GameActorView(actor: actor)
                    .offset(x: CGFloat(actor.buildingXPos-3) * 38.0, y: (CGFloat(model.rows-actor.buildingYPos)-5.5) * (32.0+floorSpacing))
                Text("\(actor.buildingXPos)")
                    .offset(x: CGFloat(actor.buildingXPos-3) * 38.0, y: (CGFloat(model.rows-actor.buildingYPos)-5.5) * (32.0+floorSpacing))
            }
        }
        
    }
}

#Preview {
    GameView()
        .environment(GameModel())
}
