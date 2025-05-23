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
    var tileType: TileType
    // only used if tile is stair, otherwise you don't need to interact with it
    var stairDirection: StairDirection = StairDirection.NONE
}

struct TileView: View {
    var tile: Tile
    var body: some View {
        Rectangle()
            .frame(width: 32, height: 32)
    }
}

#Preview {
    TileView(tile: Tile(tileType: TileType.EMPTY))
}
