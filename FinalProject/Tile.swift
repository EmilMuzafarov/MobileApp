//
//  SwiftUIView.swift
//  FinalProject
//
//  Created by Student on 5/22/25.
//

import SwiftUI

enum TileType {
    case EMPTY
    case CLASSROOM
    case LOCKER
    case STAIRS
}

struct Tile {
    var tileType: TileType
    
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
