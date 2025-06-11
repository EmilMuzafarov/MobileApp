//
//  GameModel.swift
//  FinalProject
//
//  Created by Student on 5/22/25.
//

import Foundation
import SwiftUI

@Observable class GameModel {
    // all params need to be pre-initialized
    var buildingGrid: [[Tile]] = []
    var actorList: [GameActor] = []
    // unused initializer, required to init to compile
    var player: GameActor = GameActor(buildingXPos: 0, buildingYPos: 0, facing: ActorFaceDirection.RIGHT, type: ActorType.PLAYER)
    var tasks: [String] = ["Deliver a note from locker 2 to classroom 6", "Bring Attendance from 1st floor locker to classroom 5", "Bring supplies from locker 5 to classroom 2", "Take the gym clothes from the basement locker to classroom 7", "Take handouts from locker 4 to classroom 8"]
    var taskList: [GameTask] = []
    var rows: Int = 10
    var columns: Int = 7
    var hallMonitorAmount: Int = 4
    var lockers: [Tile] = []
    var classrooms: [Tile] = []
    var buttonUsable: Bool = false
    var isDone1: Bool = false
    var isDone2: Bool = false
    var gameOver: Bool = false
    var task1_locker_used = false
    var task2_locker_used = false
    var task3_locker_used = false
    var task4_locker_used = false
    var task5_locker_used = false
    var doneList: [Bool] = [false, false, false, false, false]
    init() {
        initiateGame()
        initiateActors()
        findLockers()
        findClassrooms()
        initializeTasks()
    }
    func initializeTasks() {
        for i in 0..<tasks.count {
            taskList.append(GameTask(title: tasks[i]))
        }
    }
    func initiateGame() {
        buildTiles()
    }

    func initiateActors() {
        initiatePlayer()
        initiateHallMonitors()
    }

    func initiatePlayer() {
        player = GameActor(buildingXPos: 0, buildingYPos: 1, facing: ActorFaceDirection.LEFT, type: ActorType.PLAYER)
        actorList.append(player)
    }
    
    func returnGrid() -> [[Tile]] {
        return buildingGrid
    }
    
    func initiateHallMonitors() {
        var existingHallMonitorInds: [Int] = []
        for _hallMonitorInd in 0..<hallMonitorAmount {
            var rowPick: Int = Int.random(in: 0..<(rows-existingHallMonitorInds.count))
            rowPick = getAdjustedIndexOnIndexList(indexInt: rowPick, indexList: existingHallMonitorInds)
            existingHallMonitorInds.append(rowPick)
            
            let columnPick: Int = Int.random(in: 0..<(columns))
            let direction: ActorFaceDirection = (Int.random(in: 0...1) == 1 ? ActorFaceDirection.LEFT : ActorFaceDirection.RIGHT)
            let newHallMonitor: GameActor = GameActor(buildingXPos: columnPick, buildingYPos: rowPick, facing: direction, type: ActorType.HALL_MONITOR)
            actorList.append(newHallMonitor)
        }
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
        while focusIndex < indexList.count && indexList[focusIndex] <= (indexInt+focusIndex) {
            focusIndex += 1
        }
        return indexInt + focusIndex
    }

    func isValidBuldingTileIndex(x: Int, y: Int) -> Bool {
        if x < 0 || y < 0 {
            return false
        }
        if x >= columns || y >= rows {
            return false
        }
        return true
    }

    func getActorOnTile(x: Int, y: Int) -> GameActor? {
        if !isValidBuldingTileIndex(x: x, y: y) {
            return nil
        }
        for focusActor in actorList {
            if focusActor.buildingXPos == x && focusActor.buildingYPos == y {
                return focusActor
            }
        }
        return nil
    }
    
    func addTileOnAvailableColumn(rowInd: Int, tileType: TileType) {
        let takenTilesOnRow: [Int] = getTakenTileInds(rowInd: rowInd)
        let maxColumnIndPick: Int = columns - takenTilesOnRow.count
        var columnPick: Int = Int.random(in: 0..<maxColumnIndPick)
        columnPick = getAdjustedIndexOnIndexList(indexInt: columnPick, indexList: takenTilesOnRow)
        let newTile: Tile = Tile(tileType: tileType)
        
        self.buildingGrid[rowInd][columnPick] = newTile
    }
    
    func addStairs() {
        for yInd in 0..<rows-1 {
            var maxColumnIndPick: Int = columns-1
            let currentStairInd: Int = getFirstStairIndOnRow(rowInd: yInd)
            // Lower amount of available columns if a stair tile exists
            if currentStairInd != -1 {
                maxColumnIndPick -= 1
            }
            // Pick column, if on or after stair, adjust to allow for last column to be chosen
            var columnPick: Int = Int.random(in: 1..<maxColumnIndPick)
            if columnPick >= currentStairInd && currentStairInd != -1 {
                columnPick += 1
            }
            // Stair assignments
            let newDownStair: Tile = Tile(tileType: TileType.STAIRS, stairDirection: StairDirection.DOWN)
            let newUpStair: Tile = Tile(tileType: TileType.STAIRS, stairDirection: StairDirection.UP)
            
            
            self.buildingGrid[yInd][columnPick] = newDownStair
            self.buildingGrid[yInd+1][columnPick] = newUpStair
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
    
    // Actor behavior
    
    func updateHallMonitor(actor: GameActor) {
        let dir: Int = (actor.facing==ActorFaceDirection.LEFT ? -1 : 1)
        
        let newPos: CGPoint = CGPoint(x: actor.buildingXPos+dir, y: player.buildingYPos)
        if !isValidBuldingTileIndex(x: Int(newPos.x), y: Int(newPos.y)) {
            withAnimation {
                if actor.facing == ActorFaceDirection.LEFT {
                    actor.facing = ActorFaceDirection.RIGHT
                } else {
                    actor.facing = ActorFaceDirection.LEFT
                }
            }
        } else {
            withAnimation(.easeOut(duration: 0.2)) {
                actor.buildingXPos = Int(newPos.x)
            }
        }
        
        if actor.buildingXPos == player.buildingXPos && actor.buildingYPos == actor.buildingYPos {
            gameOver = true
        }
        
    }

    func updatePlayer(actor: GameActor) {
        buttonUsable = canPlayerInteract()
        
        
        
        print(buttonUsable)
    }

    // This runs every time the player is moved
    func updateActors() {
        var xMonitors: [Int] = []
        for focusActor in actorList {
            focusActor.actorPhase += 1
            
            switch focusActor.type {
            case ActorType.HALL_MONITOR:
                updateHallMonitor(actor: focusActor)
                break
            case ActorType.PLAYER:
                updatePlayer(actor: focusActor)
                break
            }
            xMonitors.append(focusActor.buildingXPos)
        }
    }
    
    // Player buttons
    
    func canPlayerInteract() -> Bool {
        
        return buildingGrid[rows-player.buildingYPos-1][player.buildingXPos].tileType != TileType.EMPTY
    }
    
    func movePlayer(dir: Int) {
        let newPos: CGPoint = CGPoint(x: player.buildingXPos+dir, y: player.buildingYPos)
        
        if !isValidBuldingTileIndex(x: Int(newPos.x), y: Int(newPos.y)) {
            return
        }
        
        withAnimation(.easeOut(duration: 0.2)) {
            if dir == -1 {
                player.facing = ActorFaceDirection.LEFT
            } else if dir == 1 {
                player.facing = ActorFaceDirection.RIGHT
            }
            player.buildingXPos = Int(newPos.x)
        }
        
        updateActors()
    }
    
    func playerWalkStairs(dir: Int) {
        let newPos: CGPoint = CGPoint(x: player.buildingXPos, y: player.buildingYPos+dir)
        
        if !isValidBuldingTileIndex(x: Int(newPos.x), y: Int(newPos.y)) {
            return
        }
        
        withAnimation(.easeOut(duration: 0.2)) {
            player.buildingYPos = Int(newPos.y)
        }
        
        updateActors()
    }
    
    func playerInteract() {
        var playerStandingTile: Tile = buildingGrid[rows-player.buildingYPos-1][player.buildingXPos]
        switch playerStandingTile.tileType {
        case .EMPTY:
            break
        case .CLASSROOM:
            classroomInteract(classroomTile: playerStandingTile)
            break
        case .LOCKER:
            lockerInteract(lockerTile: playerStandingTile)
            break
        case .STAIRS:
            stairInteract(stairTile: playerStandingTile)
            break
        }
    }
    
    func findLockers() {
        for r in 0..<buildingGrid.count {
            for c in 0..<buildingGrid[0].count {
                if buildingGrid[r][c].tileType == TileType.LOCKER {
                    lockers.append(buildingGrid[r][c])
                }
            }
        }
        print(fromTile)
    }
    func findClassrooms() {
        for r in 0..<buildingGrid.count {
            for c in 0..<buildingGrid[0].count {
                if buildingGrid[r][c].tileType == TileType.CLASSROOM {
                    classrooms.append(buildingGrid[r][c])
                }
            }
        }
        print(toTile)
    }
    func classroomInteract(classroomTile: Tile) {
        print("Checking classroom tiles...")
        if player.buildingYPos == 6 && task1_locker_used {
            doneList[0] = true
            completed+=1
            print("Task 1 done")
        }
        if player.buildingYPos == 5 && task2_locker_used {
            doneList[1] = true
            completed+=1
            print("Task 2 done")
        }
        if player.buildingYPos == 2 && task3_locker_used {
            doneList[2] = true
            completed+=1
            print("Task 3 done")
        }
        if player.buildingYPos == 7 && task4_locker_used {
            doneList[3] = true
            completed+=1
            print("Task 4 done")
        }
        if player.buildingYPos == 8 && task5_locker_used {
            doneList[4] = true
            completed+=1
            print("Task 5 done")
        }
        print("No tasks done")
    }
    func lockerInteract(lockerTile: Tile) {
        print("Checking lockers")
        if player.buildingYPos == 2 {
            task1_locker_used = true
            print("Locker 1 used")
        }
        if player.buildingYPos == 1 {
            task2_locker_used = true
            print("Locker 2 used")
        }
        if player.buildingYPos == 5 {
            task3_locker_used = true
            print("Locker 3 used")
        }
        if player.buildingYPos == 0 {
            task4_locker_used = true
            print("Locker 4 used")
        }
        if player.buildingYPos == 4 {
            task5_locker_used = true
            print("Locker 5 used")
        }
    }
    
    func stairInteract(stairTile: Tile) {
        if stairTile.stairDirection == StairDirection.UP {
            playerWalkStairs(dir: 1)
        } else {
            playerWalkStairs(dir: -1)
        }
    }
    
}
