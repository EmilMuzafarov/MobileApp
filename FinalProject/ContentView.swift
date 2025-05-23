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
                HStack {
                    ForEach(0 ..< tileCount, id:\.self) { b in
                        TileView(tile: Tile(tileType: TileType.EMPTY))
                            .padding(0)
                    }
                }
                .padding(5)
            }
            HStack {
                Button("LEFT") {
                    print("UP")
                }
                VStack{
                    Button("UP") {
                        print("UP")
                    }
                    .padding()
                    Button("DOWN") {
                        print("UP")
                    }
                }
                Button("RIGHT") {
                    print("UP")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(GameModel())
}
