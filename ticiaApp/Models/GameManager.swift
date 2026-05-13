//
//  GameManager.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI


enum UserResultsProfile: String, CaseIterable {
    case estagiario, aprendiz, especialista
    
    var subtitleUser: String {
        switch self {
        case .estagiario:
            return "Dessa vez as Fake News te pegaram, **Estagiário!**"
        case .aprendiz:
            return "Você foi tão bem que eu acho que já posso te considerar... **Aprendiz!**"
        case .especialista:
            return "É, você nem precisa mais da minha ajuda. Já tá... **Especialista!**"
        }
    }
    
}

enum UserResultsProfileTitle: String, CaseIterable {
    case estagiarioTitle, aprendizTitle, especialistaTitle
    
    var titleUser: String {
        switch self {
        case .estagiarioTitle:
            return "É... Te enganaram..."
        case .aprendizTitle:
            return "Muito bem!"
        case .especialistaTitle:
            return "Isso sim é especialista!"
        }
    }
    
}

enum UserResultsImage {
    case estagiarioTicia, aprendizTicia, especialistaTicia
    
    var imageUser: String {
        switch self {
        case .estagiarioTicia:
            return "estagiarioTicia"
        case .aprendizTicia:
            return "aprendizTicia"
        case .especialistaTicia:
            return "especialistaTicia"
        }
    }
}

@Observable
class GameManager {
    var listaNoticiasJogo: [Noticia] = []
    var currentNewIndex: Int?
    var currentNew: Noticia?
    var confiancaPoints: Double = 0
    var caosPoints: Double = 0
    var progress: Double = 0
    
    //      Chamar o JSON
    func getNewsFromJson() -> [Noticia] {
        return Bundle.main.decode(file: "News.json")
    }
    
    func getResult() -> UserResultsProfile {
        if ((0...30).contains(confiancaPoints)){
            return .estagiario
        } else if (31 <= confiancaPoints && confiancaPoints <= 50) {
            return .aprendiz
        }
        return .especialista
    }
    
    func getResultsTitle () -> UserResultsProfileTitle {
        if ((0...30).contains(confiancaPoints)){
            return .estagiarioTitle
        } else if (31 <= confiancaPoints && confiancaPoints <= 50) {
            return .aprendizTitle
        }
        return .especialistaTitle
    }
    
    func getResultsImage () -> UserResultsImage {
        if ((0...30).contains(confiancaPoints)){
            return .estagiarioTicia
        } else if (31 <= confiancaPoints && confiancaPoints <= 50) {
            return .aprendizTicia
        }
        return .especialistaTicia
    }
    
    func startGame() {
        listaNoticiasJogo = Array(getNewsFromJson().shuffled().prefix(10))
        currentNewIndex = 0
        caosPoints = 0
        confiancaPoints = 0
        progress = 0
        currentNew = listaNoticiasJogo[currentNewIndex ?? 0]
    }
    
    func isLastNew() -> Bool {
        return (listaNoticiasJogo.count - 1) == currentNewIndex
    }
    
    func nextNew() {
        if currentNewIndex == nil { return }
        if currentNewIndex == (listaNoticiasJogo.count - 1) { return }
        
        currentNewIndex = (currentNewIndex ?? 0) + 1
        progress = Double(currentNewIndex ?? 0)/10
        currentNew = listaNoticiasJogo[currentNewIndex!]
    }
    
}
