//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    var body: some Scene {
        WindowGroup {
            MainGameView()
                .environmentObject(GameModel())
        }
    }
}
