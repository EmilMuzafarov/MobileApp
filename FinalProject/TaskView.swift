//
//  TaskView.swift
//  FinalProject
//
//  Created by Student on 5/28/25.
//

import SwiftUI

struct Task: View {
    var title: String
    var body: some View {
        Text(title)
    }
}

struct TaskView: View {
    var body: some View {
        Text("Tasks:")
            .font(.title)
            .fontWeight(.bold)
            .padding()
        VStack {
            ForEach(tasks, id: \.self) { t in
                Task(title: t)
                    .font(.headline)
                Divider()
            }
        }
        Text("Tasks completed: \(completed)")
    }
}
#Preview {
    TaskView()
}
