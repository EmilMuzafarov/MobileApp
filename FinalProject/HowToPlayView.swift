//
//  HowToPlayView.swift
//  FinalProject
//
//  Created by Student on 6/11/25.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ZStack {
            Image("titleBackground")
                .resizable()
            VStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20.0))
                        .overlay() {
                            Text("How To Play")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                                
                        }
                        .frame(width: 300, height: 70)
                        .foregroundStyle(Color.red)
                        //.offset(x: 0, y: 30)
                }
                VStack {
                    ExtractedView(imagePath: "standingBeaver", description: "In this game, you play as the BTech mascot, BT the Beaver!")
                    ExtractedView(imagePath: "classroomDoor", description: "Your goal is to deliver various things across the school to make everyone's day.")
                    ExtractedView(imagePath: "lockerDoor", description: "Take stuff from lockers and classrooms, and deliver those things to other classrooms and lockers across the school.")
                    ExtractedView(imagePath: "walkingMonitor", description: "Watch out for the nosy teachers, who will report you if you get too close (because you're a beaver, duh)")
                }
            }
            .offset(x: 0, y: 30)
        }
    }
}

#Preview {
    HowToPlayView()
}

struct ExtractedView: View {
    var imagePath: String
    var description: String
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 20.0, height: 20.0))
            .overlay() {
                HStack {
                    Image(imagePath)
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 128.0, height: 128.0)
                    Text(description)
                        .foregroundStyle(Color.white)
                }
            }
            .frame(width: 380, height: 130)
            .foregroundStyle(Color.red)
            //.offset(x: 0, y: 30)
        
    }
}
