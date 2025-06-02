//
//  SwiftUIView.swift
//  FinalProject
//
//  Created by Student on 5/22/25.
//

import SwiftUI

enum StairDirection {
    case NONE
    case UP
    case DOWN
}

enum TileType {
    case EMPTY
    case CLASSROOM
    case LOCKER
    case STAIRS
}


struct Tile {
    static let imageDict: Dictionary = [
        TileType.EMPTY : "square.fill",
        TileType.CLASSROOM : "pencil",
        TileType.LOCKER : "trash",
        TileType.STAIRS : "stairs"
    ]
    var tileType: TileType
    // only used if tile is stair, otherwise you don't need to interact with it
    var stairDirection: StairDirection = StairDirection.NONE
    
}

struct TileView: View {
    var tile: Tile
    var body: some View {
        Image(systemName: Tile.imageDict[tile.tileType] ?? "heart.fill")
            .frame(width: 32, height: 32)
            .padding(0)
    }
}
#Preview {
    TileView(tile: Tile(tileType: TileType.EMPTY))
}
