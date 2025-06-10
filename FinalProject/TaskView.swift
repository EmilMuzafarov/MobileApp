//
//  TaskView.swift
//  FinalProject
//
//  Created by Student on 5/28/25.
//

import SwiftUI

@Observable class GameTask: Identifiable {
    var fromTile: Tile
    var fromReached: Bool = false
    var toTile: Tile
    var toReached: Bool = false
    var title: String
    var done: Bool = false
    
    init(fromTile: Tile, toTile: Tile, title: String) {
        self.fromTile = fromTile
        self.toTile = toTile
        self.title = title
    }
}

struct TaskView: View {
    @State var task: GameTask
    var body: some View {
        Text(task.title)
            .frame(maxWidth: 350)
    }
}

struct WinScreen: View {
    @State var restart = false
    var body: some View {
        Text("You Won!")
            .font(.title)
            .fontWeight(.bold)
            .padding()
            .foregroundColor(.yellow)
        NavigationStack {
            VStack {
                Button("Play Again") {
                    completed=0
                    restart=true
                }
                .bold()
                .font(.title2)
                .cornerRadius(20)
                .background(.black)
                .padding(5)
                .foregroundColor(.blue)
            }
            .navigationDestination(isPresented: $restart) {
                MainGameView()
            }
        }
    }
}
struct TaskListView: View {
    var body: some View {
        Text("Tasks:")
            .font(.title)
            .fontWeight(.bold)
            .padding()
        VStack {
            ForEach(tasks, id: \.self) { t in
                //TaskView(title: t, done: false, fromTile: buildingGrid[0][0], toTile: buildingGrid[0][0])
                //    .font(.headline)
                Divider()
            }
        }
        Text("Tasks completed: \(completed)/\(total)")
    }
}
#Preview {
    TaskView(task: GameTask(fromTile: Tile(tileType: TileType.LOCKER), toTile: Tile(tileType: TileType.CLASSROOM), title: ""))
}
