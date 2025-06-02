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
    var row: Int = 10
    var column: Int = 7
    
    func initiateGame() {
        buildTiles()
    }
    
    func addDefaultTiles() {
        for _ in 1...row {
            for _ in 1...column {
                self.buildingGrid[row][column] = Tile(tileType: TileType.EMPTY)
            }
        }
    }
    
    func getFirstStairIndOnRow(rowInd: Int) -> Int {
        for xInd in 1...column {
            if self.buildingGrid[rowInd][column].tileType == TileType.STAIRS {
                return xInd
            }
        }
        return -1
    }
    
    func getTakenTileInds(rowInd: Int) -> [Int] {
        var indList: [Int] = []
        for xInd in 1...column {
            if self.buildingGrid[rowInd][column].tileType != TileType.EMPTY {
                indList.append(xInd)
            }
        }
        return indList
    }
    
    func getAdjustedIndexOnIndexList(indexInt: Int, indexList: [Int]) -> Int {
        var focusIndex: Int = 0
        while focusIndex < indexList.count && indexList[focusIndex] <= indexInt {
            focusIndex += 1
        }
        return indexInt + focusIndex
    }
    
    func addTileOnAvailableColumn(rowInd: Int, tileType: TileType) {
        var takenTilesOnRow: [Int] = getTakenTileInds(rowInd: rowInd)
        var maxColumnIndPick: Int = column - takenTilesOnRow.count
        var columnPick: Int = Int.random(in: 1...maxColumnIndPick)
        columnPick = getAdjustedIndexOnIndexList(indexInt: columnPick, indexList: takenTilesOnRow)
        var newTile: Tile = Tile(tileType: tileType)
        self.buildingGrid[rowInd][columnPick] = newTile
    }
    
    func addStairs() {
        for yInd in 1...(row-1) {
            var maxColumnIndPick: Int = column
            var currentStairInd: Int = getFirstStairIndOnRow(rowInd: yInd)
            // Lower amount of available columns if a stair tile exists
            if currentStairInd != -1 {
                maxColumnIndPick -= 1
            }
            // Pick column, if on or after stair, adjust to allow for last column to be chosen
            var columnPick: Int = Int.random(in: 1...maxColumnIndPick)
            if columnPick <= currentStairInd {
                columnPick += 1
            }
            // Stair assignments
            var newDownStair: Tile = Tile(tileType: TileType.STAIRS, stairDirection: StairDirection.DOWN)
            var newUpStair: Tile = Tile(tileType: TileType.STAIRS, stairDirection: StairDirection.UP)
            self.buildingGrid[yInd][columnPick] = newDownStair
            self.buildingGrid[yInd+1][columnPick] = newUpStair
        }
    }
    
    // A classroom and locker for each floor
    func addClassroomsAndLockers() {
        for yInd in 1...(row-1) {
            addTileOnAvailableColumn(rowInd: yInd, tileType: TileType.CLASSROOM)
            addTileOnAvailableColumn(rowInd: yInd, tileType: TileType.LOCKER)
        }
    }
    
    func buildTiles() {
        addDefaultTiles()
        addStairs()
        addClassroomsAndLockers()
    }
    
    
}
