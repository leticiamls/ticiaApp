//
//  ContentView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
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

struct ContentView: View {
    @Environment(GameManager.self) private var gameManager: GameManager
    @Environment(CardManager.self) private var cardManager: CardManager

    @State var router = Router()
        var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 100) {
                VStack {
//                    Text("Tícia!")
//                        .font(Font.custom("Grandstander-Black", size: 96))
//                        .foregroundStyle(Color.blackTicia)
//                        .kerning(-4)
//                        .frame(height: 45)
                    Image("TíciaLogoApp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 310, height: 220)
                    Text("Teste seus conhecimentos sobre")
                        .font(Font.custom("Fredoka-Medium", size: 18))
                    Text("Fake News!")
                        .font(Font.custom("Fredoka-SemiBold", size: 18))                }

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
                            cardManager.startEstudos()
                        }
                        .environment(router)
                        .environment(cardManager)

                case .GameView:
                    JogoNewsView()
                        .onAppear {
                            gameManager.startGame()
                        }
                        .environment(router)


                case .ResultView:
                    let result = gameManager.getResult()
                    let resultTitle = gameManager.getResultsTitle()
                    ResultsView(
                        titleUser: resultTitle.titleUser,
                        subtitleUser: result.subtitleUser
                    )
                        .environment(router)
                }
            }

        }
    }
}

#Preview {
    @Previewable @State var gameManager = GameManager()
    @Previewable @State var cardManager = CardManager()


    ContentView()
        .environment(gameManager)
        .environment(cardManager)
}
