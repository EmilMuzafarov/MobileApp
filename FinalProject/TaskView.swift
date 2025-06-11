//
//  TaskView.swift
//  FinalProject
//
//  Created by Student on 5/28/25.
//

import SwiftUI
@Observable class GameTask: Identifiable {
    //var fromTile: Tile
    //var fromReached: Bool = false
    //var toTile: Tile
    //var toReached: Bool = false
    var title: String
    var done: Bool
    //fromTile: Tile, toTile: Tile,
    init(title: String, done: Bool = false) {
        //self.fromTile = fromTile
        //self.toTile = toTile
        self.title = title
        self.done = done
    }
}

struct TaskView: View {
    @State var task: GameTask
    var body: some View {
        Text(task.title)
            .frame(maxWidth: 350)
            .strikethrough(task.done, color: .gray)
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
    @Environment(GameModel.self) var model: GameModel
    var body: some View {
        Text("Tasks:")
            .font(.title)
            .fontWeight(.bold)
            .padding()
        VStack {
            ForEach(0..<model.tasks.count, id: \.self) { index in
                let task = GameTask(title: model.tasks[index], done: model.doneList[index])
                    TaskView(task: task)
                        .font(.headline)
                Divider()
            }
        }
        Text("Tasks completed: \(completed)/\(total)")
    }
}
#Preview {
    TaskView(task: GameTask(title: "Attendance"))
}
