//
//  ticiaAppApp.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

@main
struct ticiaAppApp: App {
    @State var isPresented: Bool = false
    
    @State private var gameManager: GameManager = GameManager()
    @State private var cardManager: CardManager = CardManager()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameManager)
                .environment(cardManager)
        }
    }
}
