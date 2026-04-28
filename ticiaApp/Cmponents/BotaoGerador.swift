//
//  BotaoGerador.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//
import SwiftUI

struct ButtonPrimary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .padding(16)
        .frame(width: 317)
        .background(Color.blackTicia)
        .clipShape(Capsule())
        .foregroundStyle(Color.white)
        .font(Font.custom("Fredoka-Semibold", size: 24))
    }
}

enum ButtonType {
    case primary, secondary, terciary
}

struct AnswerRow: View {
    @State private var showSheet = false
    
    var text: String
    var systemImage: String
    var buttonType: ButtonType
    
    var answer: Resposta
    
    var action: () -> Void
    
    var body: some View {
        VStack{
            switch (buttonType) {
            case .primary:
                Button {
                    action()
                }
                label: {
                    HStack{
                        Image(systemName: "systemImage")
                        Text(answer.texto)
                    }
                }
                .buttonStyle(ButtonPrimary())
                
            default:
                Button {
                    action()
                }
                label: {
                    HStack{
                        Image(systemName: "xmark")
                        Text(answer.texto)
                    }
                    .buttonStyle(ButtonPrimary())
                    .padding(18)
                    .frame(width: 150)
                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
                }
                .tint(Color(.black))
                .font(Font.system(size: 24, weight: .bold))
            }
        }
    }
}


#Preview {
    AnswerRow(text: "Excluir", systemImage: "xmark", buttonType: .secondary, answer: Resposta(texto: "Single", isCorrect: false)) {
        print("Botão customizado pressionado!")
    }
}
