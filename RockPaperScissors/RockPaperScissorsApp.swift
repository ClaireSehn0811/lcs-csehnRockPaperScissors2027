//
//  RockPaperScissorsApp.swift
//  RockPaperScissors
//
//  This file starts the app and shows the game screen.
//  You do not need to change anything here.
//

import SwiftUI

@main
struct RockPaperScissorsApp: App {

    // MARK: - Computed properties

    var body: some Scene {
        WindowGroup {
            RockPaperScissorsView()
        }
        // Open the window at the size the game asks for.
        .windowResizability(.contentSize)
    }
}
