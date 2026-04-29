//
//  ExcluirPublicarLogica.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

//struct newsAntiga {
//    let manchete: String;
//    let texto: String;
//    let fonte: String;
//    let isTrue: Bool;
//}

@Observable
class GameManager {
    var currentNewIndex: Int?
    var currentNew: Noticia?
    var confiancaPoints: Int = 0
    var caosPoints: Int = 0
    
//      Chamar o JSON
    func getNewsFromJson() -> [Noticia] {
        return Bundle.main.decode(file: "News.json")
    }
    
//    var listaNewsAntiga: [newsAntiga] = [
//        newsAntiga(manchete: "URGENTE!! Vacina CAUSA AUTISMO em CRIANÇAS!!", texto: "COMPARTILHE ANTES QUE REMOVAM!! Fontes ciemtificas afirma que vacinas causa AUTISMO!! Médicos NÃO querem que você saiba disso!! COMPARTILHE com AMIGOS e FAMÍLIA!!", fonte: "Grupo do WhatsApp", isTrue: false),
//        newsAntiga(manchete: "Notícia 2", texto: "Texto da notícia 2", fonte: "Grupo do WhatsApp", isTrue: false),
//        newsAntiga(manchete: "Notícia 3", texto: "Texto da notícia 3", fonte: "Grupo do WhatsApp", isTrue: false)
//    ]
    
    func startGame() {
        let Noticia = getNewsFromJson()
        currentNewIndex = 0
        currentNew = Noticia[currentNewIndex ?? 0]
    }
    
    func isLastNew() -> Bool {
        return (Noticia.listaNoticias.count - 1) == currentNewIndex
    }
    
    func nextNew() {
        if currentNewIndex == nil { return }
        if currentNewIndex == (Noticia.listaNoticias.count - 1) { return }
        
        currentNewIndex = (currentNewIndex ?? 0) + 1
        currentNew = Noticia.listaNoticias[currentNewIndex!]
    }
    
}
