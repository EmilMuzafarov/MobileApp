//
//  GameView.swift
//  FinalProject
//
//  Created by Student on 5/27/25.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var model: GameModel
    @State var tileCount=7
    @State var floors=10
    var body: some View {
        ForEach(0 ..< floors, id:\.self) { a in
            HStack(spacing: 0) {
                ForEach(0 ..< tileCount, id:\.self) { b in
                    TileView(tile: model.buildingGrid[a][b])
                        .padding(0)
                        
                }
            }
            .padding(0)
        }
    }
}

#Preview {
    GameView()
        .environmentObject(GameModel())
}
