//
//  TaskView.swift
//  FinalProject
//
//  Created by Student on 5/28/25.
//

import SwiftUI

struct TaskView: View {
    var fromTile: Tile
    var fromReached: Bool
    var toTile: Tile
    var toReached: Bool
    var title: String
    var done: Bool
    var body: some View {
        Text(title)
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
    TaskView()
}
