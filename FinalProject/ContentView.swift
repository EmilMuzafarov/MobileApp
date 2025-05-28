//
//  ContentView.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button() {
                TaskView()
            } label: {
                Image("taskButton")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .offset(x:150, y:-50)
            GameView()
            HStack {
                HStack {
                    Button("LEFT") {
                        print("UP")
                    }
                    Button("RIGHT") {
                        print("UP")
                    }
                }
                .padding(50)
                Spacer()
                Button() {
                    print("UP")
                } label: {
                    Image("directionButton")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding(50)
            }
        }
        .padding(0)
    }
}

#Preview {
    ContentView()
        .environmentObject(GameModel())
}
