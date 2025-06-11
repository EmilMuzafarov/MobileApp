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
    static let imageSystemDict: Dictionary = [
        TileType.EMPTY : "square.fill",
        TileType.CLASSROOM : "pencil",
        TileType.LOCKER : "trash",
        TileType.STAIRS : "stairs"
    ]
    
    static let imageDict: Dictionary = [
        TileType.CLASSROOM : "classroomDoor",
        TileType.LOCKER : "lockerDoor",
    ]
    
    static let stairImageDict: Dictionary = [
        StairDirection.DOWN: "downstairsDoor",
        StairDirection.UP: "upstairsDoor",
        StairDirection.NONE: ""
    ]
    
    var tileType: TileType
    // only used if tile is stair, otherwise you don't need to interact with it
    var stairDirection: StairDirection = StairDirection.NONE
    
}

struct TileView: View {
    var tile: Tile
    var body: some View {
        if tile.tileType == TileType.STAIRS {
            Image(Tile.stairImageDict[tile.stairDirection] ?? "heart.fill")
                .interpolation(.none)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(0)
            
        } else if Tile.imageDict.keys.contains(tile.tileType) {
            Image(Tile.imageDict[tile.tileType] ?? "heart.fill")
                .interpolation(.none)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(0)
        } else {
            Image("")
                .interpolation(.none)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(0)
        }
            
    }
}
#Preview {
    TileView(tile: Tile(tileType: TileType.EMPTY))
}
