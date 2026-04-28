//
//  PopUpView.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct PopUpView: View {
    @Binding var presentPopup: Bool
    @Binding var isTrue: Bool
    @Binding var isAcepted: Bool
    var body: some View {
        //        NavigationStack{
        if isTrue == true && isAcepted == false
            || isTrue == false && isAcepted == true
        {
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

        } else if isTrue == true && isAcepted == true
            || isTrue == false && isAcepted == false
        {
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
        else{
            Text("a")
        }
    }
}
//}

#Preview {
    @Previewable @State var isTrue: Bool = false
    @Previewable @State var isAcepted: Bool = false
    PopUpView(presentPopup: .constant(true), isTrue: $isTrue, isAcepted: $isAcepted)
}
