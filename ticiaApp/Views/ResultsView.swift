//
//  ResultsView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct ResultsView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(GameManager.self) var gameManager: GameManager
    @Environment(Router.self) var router: Router
    
    let titleUser: String
    let subtitleUser: String
    let ticiaImage: String
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let userDimensions = min(width, height)
            
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack (spacing: sizeClass == .regular ? userDimensions * 0.05 : 24) {
                    //imagem e texto
                    VStack(alignment: .center) {
                        Image(ticiaImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: sizeClass == .regular ? 300 : 220, maxHeight: sizeClass == .regular ? 280 : 200)
                            .padding(.trailing, 3)
                        Text(LocalizedStringKey(titleUser))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? userDimensions * 0.08 : userDimensions * 0.09))
                            .minimumScaleFactor(0.5)
                            .foregroundStyle(Color.blackTicia)
                        Text(LocalizedStringKey(subtitleUser))
                            .padding(.horizontal, sizeClass == .regular ? userDimensions * 0.1 : userDimensions * 0.05)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? userDimensions * 0.04 : 20))
                            .fixedSize(horizontal: false, vertical: true)

                    }
                    
                    //resultados
                    VStack(alignment: .leading, spacing: userDimensions * 0.02) {
                        Text("RESULTADOS")
                            .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? userDimensions * 0.030 : 16))
                            .frame(maxWidth: sizeClass == .regular ? userDimensions * 0.24 : 145, maxHeight: sizeClass == .regular ? 10 : 1)
                            .kerning(0.8)
                        GroupBox {
                            VStack {
                                HStack {
                                    Image(systemName: "hand.thumbsup.fill")
                                    Text("Confiança")
                                    Spacer()
                                    Text("\(Int(gameManager.confiancaPoints))%")
                                }
                                .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? userDimensions * 0.05 : 24))
                                .foregroundStyle(Color.greenTicia)
                                Gauge(value: gameManager.confiancaPoints/100) {
                                    //
                                }
                                .tint(Color(.green))
                            }
                            .padding(
                                EdgeInsets(
                                    top: 25,
                                    leading: 00,
                                    bottom: 20,
                                    trailing: 00
                                )
                            )
                            
                            
                            VStack {
                                HStack {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                    Text("Caos")
                                    Spacer()
                                    Text("\(Int(gameManager.caosPoints))%")
                                }
                                .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? userDimensions * 0.05 : 24))
                                .foregroundColor(Color(.red))
                                Gauge(value: gameManager.caosPoints/100) {
                                    //
                                }
                                .tint(Color(.red))
                            }
                            .padding(
                                EdgeInsets(
                                    top: 10,
                                    leading: 00,
                                    bottom: 30,
                                    trailing: 00
                                )
                            )
                        }
                        .padding(
                            EdgeInsets(top: 10, leading: 00, bottom: 30, trailing: 00)
                        )
                        .groupBoxStyle(CardResultsFinal())
                        .padding(
                            EdgeInsets(top: 00, leading: 16, bottom: 00, trailing: 16)
                        )
                    }
                    .frame(maxWidth: sizeClass == .regular ? 760 : .infinity)
                    
                    //botões
                    VStack(spacing: 16) {

                        Button {
                            router.resetView()
                            gameManager.caosPoints = 0
                            gameManager.confiancaPoints = 0
                            gameManager.progress = 0
                            
                        } label: {
                            HStack {
                                Text("Jogar novamente")
                                    .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? userDimensions * 0.05 : 24))
                            }
                        }
                        .buttonStyle(ButtonPrimary())
                        
                        Button {
                            router.restartNavigation()
                            gameManager.caosPoints = 0
                            gameManager.confiancaPoints = 0
                            gameManager.progress = 0
                        } label: {
                            HStack {
                                Text("Voltar para o menu")
                                    .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? userDimensions * 0.05 : 24))

                            }
                        }
                        .buttonStyle(ButtonTerciary())
                        
                    }
                    .frame(maxWidth: sizeClass == .regular ? userDimensions * 1 : .infinity)
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                }
                .padding(8)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarBackButtonHidden()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    @Previewable @State var gameManager = GameManager()
    @Previewable @State var router = Router()
    
    ResultsView(
        titleUser: "Isso sim é especialista!",
        subtitleUser: "É, você nem precisa mais da minha ajuda. Já tá... **Especialista!**",
        ticiaImage: "aprendizTicia"
    )
    .environment(router)
    .environment(gameManager)
}
