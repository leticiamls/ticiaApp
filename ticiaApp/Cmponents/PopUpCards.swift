//
//  PopUpCards.swift
//  ticiaApp
//
//  Created by User on 28/04/26.
//

import SwiftUI

//card da pagina de resultado
struct CardResultsFinal: GroupBoxStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.content
                .padding(
                    EdgeInsets(top: 00, leading: 16, bottom: 00, trailing: 16)
                )
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(Color(.lightGray), lineWidth: 1.7)
        )
    }
}

//estilo de pop-up
struct PopUp: GroupBoxStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.content
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(Color(.lightGray), lineWidth: 1)
        )
        .foregroundStyle(Color.blackTicia)
        .frame(maxWidth: 370, maxHeight: 575)
        .backgroundStyle(Color.clear)
    }
}

struct PopUpViewNegative: View {
    @Binding var presentPopup: Bool
    @Environment(GameManager.self) var gameManager: GameManager

    var body: some View {
        ZStack {
            GroupBox {
                VStack {
                    Text("Vixi... Essa é Fake")
                        .font(Font.custom("Fredoka-SemiBold", size: 36))
                    Image("tíciaFeliz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(
                            EdgeInsets(
                                top: 00,
                                leading: 0,
                                bottom: 00,
                                trailing: 40
                            )
                        )

                    VStack(alignment: .leading) {
                        Text(gameManager.currentNew?.justificativaErro ?? "Erro")
                            .font(Font.custom("Fredoka-Regular", size: 20))
                        Spacer()
                            .frame(height: 12)
                        HStack {
                            Image(
                                systemName: "exclamationmark.triangle.fill"
                            )
                            .font(Font.custom("Fredoka-Semibold", size: 20))
                            Text("+ 10 de Caos")
                                .font(
                                    Font.custom(
                                        "Fredoka-Semibold",
                                        size: 24
                                    )
                                )
                        }
                        .foregroundStyle(Color(.red))
                    }

                }

                Spacer()
                    .frame(height: 16)

                Button {
                    presentPopup.toggle()
                } label: {
                    HStack {
                        Text("Próxima")
                            .font(Font.custom("Fredoka-Semibold", size: 24))
                            .foregroundColor(Color(.white))
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color(.white))
                            .font(Font.custom("Fredoka-Semibold", size: 24))
                    }
                    .padding(10)
                    .frame(width: 317)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(.red))

            }
            .groupBoxStyle(PopUp())
            .padding(
                EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
            )
        }

    }
}

struct PopUpViewPositive: View {
    @Binding var presentPopup: Bool
    @Environment(GameManager.self) var gameManager: GameManager
    var body: some View {
        ZStack {
            GroupBox {
                VStack {
                    Text("Essa é verdade!")
                        .font(Font.custom("Fredoka-SemiBold", size: 36))
                    Image("tíciaFeliz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(
                            EdgeInsets(
                                top: 00,
                                leading: 0,
                                bottom: 00,
                                trailing: 40
                            )
                        )

                    VStack(alignment: .leading) {
                        Text(gameManager.currentNew?.justificativaAcerto ?? "Erro")
                            .font(Font.custom("Fredoka-Regular", size: 20))
                        Spacer()
                            .frame(height: 12)
                        HStack {
                            Image(
                                systemName: "exclamationmark.triangle.fill"
                            )
                            .font(Font.custom("Fredoka-Semibold", size: 20))
                            Text("+ 10 de Confiança")
                                .font(
                                    Font.custom(
                                        "Fredoka-Semibold",
                                        size: 24
                                    )
                                )
                        }
                        .foregroundStyle(Color(.greenTicia))
                    }

                }

                Spacer()
                    .frame(height: 16)

                Button {
                    presentPopup.toggle()
                } label: {
                    HStack {
                        Text("Próxima")
                            .font(Font.custom("Fredoka-Semibold", size: 24))
                            .foregroundColor(Color(.white))
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color(.white))
                            .font(Font.custom("Fredoka-Semibold", size: 24))
                    }
                    .padding(10)
                    .frame(width: 317)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(.greenTicia))

            }
            .groupBoxStyle(PopUp())
            .padding(
                EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
            )
        }
    }
}

struct CardEstudar: View {
    
    @Environment(CardManager.self) var cardManager: CardManager
    
    var body: some View {
        VStack (alignment: .center){
            GroupBox{
                VStack(alignment: .center, spacing: 24){
                    HStack{
                        Text(cardManager.currentNew.tituloEstudo)
                            .frame(
                                maxWidth: .infinity)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(Font.custom("Fredoka-SemiBold", size: 28))
                    }.multilineTextAlignment(.center)
                    
                    Text(cardManager.currentNew.descricaoEstudo)
                        .font(Font.custom("Fredoka-Regular", size: 20))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxHeight: 100)
                        .foregroundStyle(Color(.blackTicia))
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading, spacing: 50){
                        HStack{
                            Image(systemName: "x.circle.fill").foregroundColor(.red)
                            Text(cardManager.currentNew.exemploMentira)
                                .font(Font.custom("Fredoka-Medium", size: 18))
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxHeight: 40)
                        }
                        HStack{
                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                            Text(cardManager.currentNew.exemploVerdade)
                                .font(Font.custom("Fredoka-Medium", size: 18))
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxHeight: 22)
                        }
                    }
                }
            }
            .padding(.bottom, 40)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(Color(.lightGray), lineWidth: 1))
            .foregroundStyle(Color.blackTicia)
            .frame(maxWidth: 327 , maxHeight: 393)
            .backgroundStyle(Color.clear)
        }

    }
}

struct CardJogo: View {
    @Environment(GameManager.self) var gameManager: GameManager

    var body: some View {
        
        VStack (alignment: .leading){
            GroupBox{
                Image(gameManager.currentNew?.foto ?? "Sem valor")
                    .resizable()
                    .frame(width: 300, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading){
                    Text(gameManager.currentNew?.titulo ?? "Sem valor")
                        .font(Font.custom("Fredoka-SemiBold", size: 24))

                    Text(gameManager.currentNew?.resumo ?? "Sem valor")
                        .font(Font.custom("Fredoka-Regular", size: 16))
                        .frame(maxHeight: 100)
                        .foregroundStyle(Color(.secondaryLabel))
                    VStack(alignment: .leading){
                        Text("Fonte: \(gameManager.currentNew?.fonte ?? "Sem valor")")
                            .font(Font.custom("Fredoka-Regular", size: 15))
                    }
                }
            }
            
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(Color(.lightGray), lineWidth: 1))
            .foregroundStyle(Color.blackTicia)
            .frame(maxWidth: 327 , maxHeight: 393)
            .backgroundStyle(Color.clear)
        }    }
}

#Preview {
    @Previewable @State var gameManager = GameManager()
//
//    CardEstudar(estudos:Estudo(tituloEstudo: "Títulos Sensacionalistas", descricaoEstudo: "Uso de títulos chamativos e letras garrafais com apelo emocional para incentivar o compartilhamento rápido.", exemploMentira: "MUITO CUIDADO! COMER ARROZ DE ONTEM MATA", exemploVerdade: "Entenda a relação entre o armazenamento do arroz e o risco de intoxicação bacteriana"))
}
