//
//  GameView.swift
//  FinalProject
//
//  Created by Student on 5/27/25.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var model: GameModel
    var body: some View {
        ZStack {
            VStack{
                ForEach(0 ..< model.rows, id:\.self) { a in
                    HStack(spacing: 0) {
                        ForEach(0 ..< model.columns, id:\.self) { b in
                            TileView(tile: model.buildingGrid[a][b])
                                .padding(0)
                            
                        }
                    }
                    .padding(0)
                }
            }
            ForEach(0 ..< model.actorList.count, id:\.self) { actorInd in
                GameActorView(actor: model.actorList[actorInd])
                    .offset(x: CGFloat(model.actorList[actorInd].buildingXPos-3) * 32.0, y: (CGFloat(model.rows-model.actorList[actorInd].buildingYPos)-4) * 32.0)
            }
        }
    }
}

#Preview {
    GameView()
        .environmentObject(GameModel())
}
