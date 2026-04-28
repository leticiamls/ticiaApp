//
//  CardNews.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct news {
    let manchete: String;
    let texto: String;
    let fonte: String;
    let isTrue: Bool;
}

struct Resposta {
    var texto: AttributedString
    var isCorrect: Bool
}

var RespostaRow: [Resposta] = [
    Resposta(texto: ("Excluir"), isCorrect: true),
    Resposta(texto: ("Publicar"), isCorrect: false)
]

var newsList: [news] = [
    news(manchete: "URGENTE!! Vacina CAUSA AUTISMO em CRIANÇAS!!", texto: "COMPARTILHE ANTES QUE REMOVAM!! Fontes ciemtificas afirma que vacinas causa AUTISMO!! Médicos NÃO querem que você saiba disso!! COMPARTILHE com AMIGOS aaaaaaaaaaaaaaaaaaaaaaaaaLWIRFHIEHRFIUEIHRFIUHEDISRKFJDKLSRHFUKEDRHFUIOEHRe FAMÍLIA!!", fonte: "Grupo do WhatsApp", isTrue: true),
    news(manchete: "Notícia 2", texto: "Texto da notícia 2", fonte: "Grupo do WhatsApp", isTrue: false),
    news(manchete: "Notícia 3", texto: "Texto da notícia 3", fonte: "Grupo do WhatsApp", isTrue: false)
]

struct Tester: View {
//    @State var presetPublish: Bool = false
//    @State var presentDelete: Bool = false
    @Binding var presentPopup: Bool

    var body: some View {
        HStack {
            Text(RespostaRow[0].texto)
            AnswerRow(text: "Excluir", systemImage: "xmark", buttonType: .secondary, answer: Resposta(texto: "Excluir", isCorrect: true), action: {
                presentPopup.toggle()

//              print("Aqui vai excluir")
            })
            AnswerRow(text: "Publicar", systemImage: "checkmark", buttonType: .primary, answer: Resposta(texto: "Publicar", isCorrect: false)) {
                
                
            }
        }
        .overlay {
            if presentPopup {
                ZStack {
                    Color.black.opacity(0.3).ignoresSafeArea().onTapGesture {
                        withAnimation {
                            presentPopup.toggle()
                        }
                    }
                }
                PopUpView(presentPopup: $presentPopup)
                    .transition(.scale)
            }
            
        }
    }
}

#Preview {
    Tester(presentPopup: .constant(false))
}
