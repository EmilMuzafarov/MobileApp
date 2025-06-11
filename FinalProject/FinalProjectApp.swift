//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Student on 5/19/25.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    @State private var model = GameModel()
    
    var body: some Scene {
        WindowGroup {
            TitleScreenView()
                .environment(model)
        }
    }
}
