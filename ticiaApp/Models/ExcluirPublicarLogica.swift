//
//  ExcluirPublicarLogica.swift
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
    news(manchete: "URGENTE!! Vacina CAUSA AUTISMO em CRIANÇAS!!", texto: "COMPARTILHE ANTES QUE REMOVAM!! Fontes ciemtificas afirma que vacinas causa AUTISMO!! Médicos NÃO querem que você saiba disso!! COMPARTILHE com AMIGOS e FAMÍLIA!!", fonte: "Grupo do WhatsApp", isTrue: false),
    news(manchete: "Notícia 2", texto: "Texto da notícia 2", fonte: "Grupo do WhatsApp", isTrue: false),
    news(manchete: "Notícia 3", texto: "Texto da notícia 3", fonte: "Grupo do WhatsApp", isTrue: false)
]

@Observable
class GameManager {
    var currentNewIndex: Int?
    var currentNew: news?

    var newsList: [news] = [
        news(manchete: "URGENTE!! Vacina CAUSA AUTISMO em CRIANÇAS!!", texto: "COMPARTILHE ANTES QUE REMOVAM!! Fontes ciemtificas afirma que vacinas causa AUTISMO!! Médicos NÃO querem que você saiba disso!! COMPARTILHE com AMIGOS e FAMÍLIA!!", fonte: "Grupo do WhatsApp", isTrue: false),
        news(manchete: "Notícia 2", texto: "Texto da notícia 2", fonte: "Grupo do WhatsApp", isTrue: false),
        news(manchete: "Notícia 3", texto: "Texto da notícia 3", fonte: "Grupo do WhatsApp", isTrue: false)
    ]
    
    
    func startGame() {
        currentNewIndex = 0
        currentNew = newsList[currentNewIndex ?? 0]
    }
    
    func isLastNew() -> Bool {
        return (newsList.count - 1) == currentNewIndex
    }
    
    func nextNew() {
        if currentNewIndex == nil { return }
        if currentNewIndex == (newsList.count - 1) { return }
        
        currentNewIndex = (currentNewIndex ?? 0) + 1
        currentNew = newsList[currentNewIndex!]
    }
    
}

//struct Tester: View {
////    @State var presetPublish: Bool = false
////    @State var presentDelete: Bool = false
//    @Binding var presentPopup: Bool
//
//    var body: some View {
//        HStack {
//            AnswerRow(text: "Excluir", buttonType: .buttonDeleta, answer: Resposta(texto: "Excluir", isCorrect: true), action: {
//                presentPopup.toggle()
//
////              print("Aqui vai excluir")
//            })
//            AnswerRow(text: "Publicar", buttonType: .buttonPublicar, answer: Resposta(texto: "Publicar", isCorrect: false)) {
//                
//                
//            }
//        }
//        .overlay {
//            if presentPopup {
//                ZStack {
//                    Color.black.opacity(0.3).ignoresSafeArea().onTapGesture {
//                        withAnimation {
//                            presentPopup.toggle()
//                        }
//                    }
//                }
////                PopUpView(presentPopup: $presentPopup)
//                    .transition(.scale)
//            }
//            
//        }
//    }
//}
//
//#Preview {
//    Tester(presentPopup: .constant(false))
//}
