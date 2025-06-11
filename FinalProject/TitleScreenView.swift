//
//  TitleScreenView.swift
//  FinalProject
//
//  Created by Student on 6/11/25.
//

import SwiftUI

struct TitleScreenView: View {
    var body: some View {
        @Environment(GameModel.self) var model: GameModel
        @State var headingToMainGame = false
        @State var headingToHowToPlay = false
        NavigationView() {
            ZStack {
                Image("titleBackground")
                    .resizable()
                VStack {
                    Button() {
                        headingToMainGame = true
                    } label: {
                        Image("titlePlay")
                            //.resizable()
                            //.scaleEffect(CGSize(width: 0.2, height: 0.2))
                    }
                    Button() {
                        headingToHowToPlay = true
                    } label: {
                        Image("titleHowToPlay")
                            //.resizable()
                            //.scaleEffect(CGSize(width: 0.2, height: 0.2))
                    }
                }
            }
        }
        .navigationDestination(isPresented: $headingToMainGame) {
            MainGameView()
                .environment(model)
        }
        .navigationDestination(isPresented: $headingToHowToPlay) {
            HowToPlayView()
                .environment(model)
        }
    }
}

#Preview {
    TitleScreenView()
        .environment(GameModel())
}
