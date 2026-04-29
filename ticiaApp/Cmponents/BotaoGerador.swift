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
        .frame(width: 340)
        .background(Color.blackTicia)
        .clipShape(Capsule())
        .foregroundStyle(Color.white)
        .tint(Color(.black))
        .font(Font.custom("Fredoka-SemiBold", size: 24))
    }
}

struct ButtonSecondary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .padding(16)
        .frame(width: 327)
        .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
    
    .tint(Color(.black))
    .font(Font.custom("Fredoka-SemiBold", size: 24))
    }
}

struct ButtonTerciary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(width: 370)
        .buttonStyle(PlainButtonStyle())
    .font(Font.custom("Fredoka-Semibold", size: 24))
    .foregroundStyle(Color.blackTicia)
    }
}

struct ButtonDelete: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(18)
            .frame(width: 150)
        .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
    
    .tint(Color(.black))
    .font(Font.custom("Fredoka-SemiBold", size: 24))
    }
}

struct ButtonPublish: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .padding(18)
        .frame(width: 165)
        .background(Color.blackTicia)
        .clipShape(Capsule())
        .foregroundStyle(Color.white)
        .tint(Color(.black))
        .font(Font.custom("Fredoka-SemiBold", size: 24))
    }
}


enum ButtonType {
    case primary, secondary, terciary, buttonDeleta, buttonPublicar
}
//
//struct AnswerRow: View {
//    
//    var text: String
//    var buttonType: ButtonType
//    
//    var answer: Resposta
//    
//    var action: () -> Void
//    
//    var body: some View {
//        VStack{
//            switch (buttonType) {
//            case .primary:
//                Button {
//                    action()
//                }
//                label: {
//                    HStack{
//                        Text(answer.texto)
//                    }
//                }
//                .buttonStyle(ButtonPrimary())
//                
//            case .secondary:
//                Button {
//                    action()
//                }
//                label: {
//                    HStack{
//                        Text(answer.texto)
//                    }
//                }
//                .buttonStyle(ButtonSecondary())
//                
//            case .terciary:
//                Button {
//                    action()
//                }
//                label: {
//                    HStack{
//                        Text(answer.texto)
//                    }
//                }
//                .buttonStyle(ButtonTerciary())
//                
//            case .buttonDeleta:
//                Button {
//                    action()
//                }
//                label: {
//                    HStack{
//                        Text(answer.texto)
//                    }
//                }
//                .buttonStyle(ButtonDelete())
//                
//            case .buttonPublicar:
//                Button {
//                    action()
//                }
//                label: {
//                    HStack{
//                        Text(answer.texto)
//                    }
//                }
//                .buttonStyle(ButtonPublish())
//            }
//        }
//    }
//}
//
//
//#Preview {
//    AnswerRow(text: "Excluir", buttonType: .buttonDeleta, answer: Resposta(texto: "Botão", isCorrect: false)) {
//        print("Botão customizado pressionado!")
//    }
//}
