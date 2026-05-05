//
//  ResultsView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct ResultsView: View {
    @Environment(GameManager.self) var gameManager: GameManager

    @Environment(Router.self) var router: Router
    
    let titleUser: String
    let subtitleUser: String
        
    var body: some View {
        VStack {
            //imagem e texto
            VStack(alignment: .center) {
                Image("tíciaFeliz")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 160)
                    .padding(
                        EdgeInsets(
                            top: 00,
                            leading: 00,
                            bottom: 00,
                            trailing: 35
                        )
                    )
                Text(titleUser)
                    .font(Font.custom("Fredoka-Semibold", size: 40))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.blackTicia)
                Text(subtitleUser)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .font(Font.custom("Fredoka-Medium", size: 20))
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 30, trailing: 20))

            //resultados
            VStack(alignment: .leading) {
                Text("RESULTADOS")
                    .font(Font.custom("Fredoka-Medium", size: 16))
                    .foregroundStyle(Color(.gray))
                    .frame(width: 145, height: 1)
                    .kerning(0.8)
                GroupBox {
                    VStack {
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("Confiança")
                            Spacer()
                            Text("\(Int(gameManager.confiancaPoints))%")
                        }
                        .font(Font.custom("Fredoka-Semibold", size: 24))
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

                    Divider()

                    VStack {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                            Text("Caos")
                            Spacer()
                            Text("\(Int(gameManager.caosPoints))%")
                        }
                        .font(Font.custom("Fredoka-SemiBold", size: 24))

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
                .font(Font.system(size: 24, weight: .bold))
            }
            Spacer()

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
                    }
                    .frame(width: 340)
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
                    }
                }
                .buttonStyle(ButtonTerciary())

            }
        }
        .navigationBarBackButtonHidden()

    }
 
}
#Preview {
    @Previewable @State var gameManager = GameManager()
    @Previewable @State var router = Router()

    ResultsView(
        titleUser: "Muito bem!",
        subtitleUser: "Você foi tão bem que eu acho que posso te considerar um... Aprendiz."
    )
        .environment(router)
        .environment(gameManager)
}
