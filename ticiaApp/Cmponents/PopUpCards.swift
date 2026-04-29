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
                .padding(EdgeInsets(top: 00, leading: 16, bottom: 00, trailing: 16))
        }
        .background(RoundedRectangle(cornerRadius: 20)
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
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .stroke(Color(.lightGray), lineWidth: 1))
        .foregroundStyle(Color.blackTicia)
        .frame(maxWidth: 370, maxHeight: 575)
        .backgroundStyle(Color.clear)
    }
}

struct PopUpViewNegative: View {
    @Binding var presentPopup: Bool

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
                        Text("Essa tava com toda cara de ser fake:")
                            .font(Font.custom("Fredoka-Regular", size: 20))
                        Text(
                            "título em CAPS LOCK, não cita fonte confiável, faz apelo emocional..."
                        )
                        .font(Font.custom("Fredoka-Semibold", size: 20))
                        Text("Não publique notícias assim!")
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
                        Text("Essa tava com toda cara de ser fake:")
                            .font(Font.custom("Fredoka-Regular", size: 20))
                        Text(
                            "título em CAPS LOCK, não cita fonte confiável, faz apelo emocional..."
                        )
                        .font(Font.custom("Fredoka-Semibold", size: 20))
                        Text("Não publique notícias assim!")
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

#Preview {
    PopUpViewNegative(presentPopup: .constant(true))
    
}
