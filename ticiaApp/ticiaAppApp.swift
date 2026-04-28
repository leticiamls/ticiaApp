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
    var body: some Scene {
        WindowGroup {
            Tester(presentPopup: $isPresented)
        }
    }
}
