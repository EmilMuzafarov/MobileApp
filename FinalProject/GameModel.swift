//
//  GameModel.swift
//  FinalProject
//
//  Created by Student on 5/22/25.
//

import Foundation

class GameModel: ObservableObject {
    @Published var buildingGrid: [[Tile]] = [[]]
    @Published var actorList: [GameActor] = []
    @Published var player: GameActor = GameActor()
    @Published var taskList: [GameTask] = []
    var row:Int = 10
    var column:Int = 7
    @Published var buildingGrid: [[TileView]] = [[]]
    func build() {
        for _ in 1...row {
            for _ in 1...column {
                self.buildingGrid[row][column] = TileView(tile: Tile(tileType: TileType.STAIRS))
                column+=1
            }
            row+=1
        }
    }
}
