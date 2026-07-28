//
//  PopUpViewPositive.swift
//  ticiaApp
//
//  Created by User on 28/04/26.
//

import SwiftUI


struct PopUpViewPositive: View {
    @Binding var presentPopup: Bool
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(GameManager.self) var gameManager: GameManager
    
    var body: some View {
        ZStack {
            GroupBox {
                VStack {
                    Text("Boa! Acertou!")
                        .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 42 : 36))
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
                        Text(LocalizedStringKey(gameManager.currentNew?.justificativaAcerto ?? "Erro"))
                            .font(Font.custom("Fredoka-Regular", size: sizeClass == .regular ? 24 : 20))
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                            .frame(height: 12)
                        HStack {
                            Image(
                                systemName: "exclamationmark.triangle.fill"
                            )
                            .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? 24 : 20))
                            Text("+ 10 de Confiança")
                                .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? 32 : 24))

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
                            .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? 32 : 24))
                            .foregroundColor(Color(.blackTicia))
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color(.blackTicia))
                            .font(Font.custom("Fredoka-Semibold", size: sizeClass == .regular ? 32 : 24))
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
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
    @Previewable @State var gameManager = GameManager()
}
