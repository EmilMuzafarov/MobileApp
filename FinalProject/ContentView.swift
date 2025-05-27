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
                Button("Interact") {
                    print("UP")
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
