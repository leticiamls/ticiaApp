//
//  ContentView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(GameManager.self) private var gameManager: GameManager
    @Environment(EstudarManager.self) private var estudarManager: EstudarManager
    
    @State var router = Router()
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 100) {
                VStack {
                    Image("TíciaLogoApp")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: sizeClass == .regular ? 400 : 310, maxHeight: sizeClass == .regular ? 280 : 220)
                    Text("Teste seus conhecimentos sobre")
                        .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 28 : 18))
                    Text("Fake News!")
                    .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? 28 : 18))
                }
                
                //botoes
                VStack(spacing: 30) {
                    Button {
                        router.goTo(.GameView)
                    } label: {
                        HStack {
                            Image(systemName: "gamecontroller.fill")
                            Text("Jogar")
                        }
                    }
                    .buttonStyle(ButtonPrimary())
                    
                    Button {
                        router.goTo(.EstudarView)
                    } label: {
                        HStack {
                            Image(systemName: "book.fill")
                            Text("Estudar")
                        }
                        
                    }
                    .buttonStyle(ButtonSecondary())
                    
                }
            }
            .padding(32)
            .navigationBarBackButtonHidden()
            .navigationDestination(for: NavigationDestinations.self) {
                destination in
                switch destination {
                case .MenuView:
                    ContentView()
                        .onAppear {
                            gameManager.caosPoints = 0
                            gameManager.confiancaPoints = 0
                            gameManager.progress = 0
                        }
                        .environment(router)
                case .EstudarView:
                    EstudarView()
                        .onAppear {
                            estudarManager.startEstudos()
                        }
                        .environment(router)
                        .environment(estudarManager)
                    
                case .GameView:
                    JogoNewsView()
                        .onAppear {
                            gameManager.startGame()
                        }
                        .environment(router)
                    
                    
                case .ResultView:
                    let result = gameManager.getResult()
                    let resultTitle = gameManager.getResultsTitle()
                    let resultImage = gameManager.getResultsImage()
                    ResultsView(
                        titleUser: resultTitle.titleUser,
                        subtitleUser: result.subtitleUser,
                        ticiaImage: resultImage.imageUser
                    )
                    .environment(router)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var gameManager = GameManager()
    @Previewable @State var estudarManager = EstudarManager()
    
    
    ContentView()
        .environment(gameManager)
        .environment(estudarManager)
}
