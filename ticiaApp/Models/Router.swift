//
//  Router.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

enum NavigationDestinations: Hashable {
    case MenuView
    case GameView
    case ResultView
    case EstudarView
}

@Observable
class Router {
    var path = NavigationPath()
    
    func goTo(_ destination: NavigationDestinations) {
        path.append(destination)
    }
    
    func restartNavigation() {
        path = .init()
    }
    
    func resetView() {
        path.removeLast()
    }
    
}
