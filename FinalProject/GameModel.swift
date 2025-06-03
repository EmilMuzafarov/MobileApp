//
//  GameModel.swift
//  FinalProject
//
//  Created by Student on 5/22/25.
//

import Foundation

class GameModel: ObservableObject {
    @Published var buildingGrid: [[Tile]] = []
    @Published var actorList: [GameActor] = []
    @Published var player: GameActor = GameActor()
    @Published var taskList: [GameTask] = []
    var rows: Int = 10
    var columns: Int = 7
    
    init() {
        initiateGame()
    }
    
    func initiateGame() {
        buildTiles()
    }
    
    func addDefaultTiles() {
        for row in 0..<rows {
            self.buildingGrid.append([])
            for _ in 0..<columns {
                self.buildingGrid[row].append(Tile(tileType: TileType.EMPTY))
            }
        }
    }
    
    func getFirstStairIndOnRow(rowInd: Int) -> Int {
        for xInd in 0..<columns {
            if self.buildingGrid[rowInd][xInd].tileType == TileType.STAIRS {
                return xInd
            }
        }
        return -1
    }
    
    func getTakenTileInds(rowInd: Int) -> [Int] {
        var indList: [Int] = []
        for xInd in 0..<columns {
            if self.buildingGrid[rowInd][xInd].tileType != TileType.EMPTY {
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
        var maxColumnIndPick: Int = columns - takenTilesOnRow.count
        var columnPick: Int = Int.random(in: 1...maxColumnIndPick)
        columnPick = getAdjustedIndexOnIndexList(indexInt: columnPick, indexList: takenTilesOnRow)
        var newTile: Tile = Tile(tileType: tileType)
        self.buildingGrid[rowInd][columnPick] = newTile
    }
    
    func addStairs() {
        for yInd in 0..<rows {
            var maxColumnIndPick: Int = columns
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
            
            if yInd < rows-1 {
                self.buildingGrid[yInd+1][columnPick] = newUpStair
            }
        }
    }
    
    // A classroom and locker for each floor
    func addClassroomsAndLockers() {
        for yInd in 0..<rows {
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
