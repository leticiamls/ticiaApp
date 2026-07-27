//
//  ticiaAppApp.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI
import TipKit

@main
struct ticiaAppApp: App {
    @State var isPresented: Bool = false
    
    @State private var gameManager: GameManager = GameManager()
    @State private var estudarManager: EstudarManager = EstudarManager()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([
//                        .displayFrequency(.immediate)
                        .datastoreLocation(.applicationDefault)])
                }
                .environment(gameManager)
                .environment(estudarManager)
        }
    }
}
