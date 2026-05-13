//
//  PopUpViewNegative.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

struct PopUpViewNegative: View {
    @Binding var presentPopup: Bool
    @Environment(GameManager.self) var gameManager: GameManager
    
    
    var body: some View {
        ZStack {
            GroupBox {
                VStack {
                    Text("Vixi... Tá errado...")
                        .font(Font.custom("Fredoka-SemiBold", size: 36))
                    Image("ticiaTristePopUp")
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
                        Text(LocalizedStringKey(gameManager.currentNew?.justificativaErro ?? "Erro"))
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
