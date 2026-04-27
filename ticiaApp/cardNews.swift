//
//  cardNews.swift
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

var newsList: [news] = [
    news(manchete: "URGENTE!! Vacina CAUSA AUTISMO em CRIANÇAS!!", texto: "COMPARTILHE ANTES QUE REMOVAM!! Fontes ciemtificas afirma que vacinas causa AUTISMO!! Médicos NÃO querem que você saiba disso!! COMPARTILHE com AMIGOS aaaaaaaaaaaaaaaaaaaaaaaaaLWIRFHIEHRFIUEIHRFIUHEDISRKFJDKLSRHFUKEDRHFUIOEHRe FAMÍLIA!!", fonte: "Grupo do WhatsApp", isTrue: true),
    news(manchete: "Notícia 2", texto: "Texto da notícia 2", fonte: "Grupo do WhatsApp", isTrue: false),
    news(manchete: "Notícia 3", texto: "Texto da notícia 3", fonte: "Grupo do WhatsApp", isTrue: false)
]

struct tester: View {
    var body: some View {
        HStack {
            AnswerRow(answer: Resposta(texto: "Excluir", isCorrect: true))
            AnswerRow(answer: Resposta(texto: "Publicar", isCorrect: false))
        }
    }
}

#Preview {
    tester()
}
