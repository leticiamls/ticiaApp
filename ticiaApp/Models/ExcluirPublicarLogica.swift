//
//  ExcluirPublicarLogica.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
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
class CardManager {
    let estudosLista: [Estudo] = [
        Estudo(tituloEstudo: "Sensacionalismo", descricaoEstudo: "Uso de títulos chamativos e de **CAPS LOCK** com apelo emocional para incentivar o compartilhamento rápido.", exemploMentira: "**MUITO CUIDADO! COMER ARROZ DE ONTEM PODE MATAR!!!**", exemploVerdade: "Entenda a relação entre o armazenamento do arroz e o risco de intoxicação bacteriana"),
        Estudo(tituloEstudo: "Erros gramaticais e ortográficos", descricaoEstudo: "Conteúdos desinformativos geralmente não passam por revisões. A presença de erros de grosseiros de portugues, a falta de coesão e a pontuação excessiva são sinais que exigem atenção.", exemploMentira: "**O GOVERMO VAI CONFICAR SUA POUPANÇA AMANA!!!!! COMO EVITAR VEJA...**", exemploVerdade: "Banco Central informa novas regras para o rendimento da poupança"),
        Estudo(tituloEstudo: "URL’s Falsas e/ou com Domínio Estranho", descricaoEstudo: "Criação de endereços web que imitam portais de notícias famosos, alterando uma letra ou usando extensões incomuns (como .net.br, .co em vez de .pt ou .com.br ). ", exemploMentira: "**hps://a.cnbrazil.con.net**", exemploVerdade: "**https://www.cnnbrasil.com.br**")]
    var currentStudyIndex: Int = 0
    var progress: Double = 0
    
    var currentStudy: Estudo {
        estudosLista[currentStudyIndex]
    }
    
    func startEstudos() {
        currentStudyIndex = 0
        progress = 0
    }
    
    func isLastNew() -> Bool {
        return (estudosLista.count - 1) == currentStudyIndex
    }
    
    func nextNew() {
        if currentStudyIndex == (estudosLista.count - 1) { return }
        
        currentStudyIndex = (currentStudyIndex) + 1
        progress = Double(currentStudyIndex)/5
    }
    
    func backCard () {
        currentStudyIndex = (currentStudyIndex) - 1
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

struct Estudo: Identifiable {
    var id: UUID = UUID()
    var tituloEstudo: String
    var descricaoEstudo: LocalizedStringKey
    var exemploMentira: LocalizedStringKey
    var exemploVerdade: LocalizedStringKey
}
