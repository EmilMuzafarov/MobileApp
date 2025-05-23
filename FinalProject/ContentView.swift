//
//  ContentView.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    @State var tileCount=7
    @State var floors=10
    var body: some View {
        VStack {
            ForEach(0 ..< floors, id:\.self) { a in
                HStack(spacing: 0) {
                    ForEach(0 ..< tileCount, id:\.self) { b in
                        TileView(tile: Tile(tileType: TileType.EMPTY))
                            .padding(0)
                    }
                }
                .padding(0)
            }
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
