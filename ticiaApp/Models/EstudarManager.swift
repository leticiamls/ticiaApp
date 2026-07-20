//
// CardManager.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

@Observable
class EstudarManager {
    let estudosLista: [Estudo] = [
        Estudo(tituloEstudo: "Sensacionalismo", descricaoEstudo: "Uso de títulos chamativos e de **CAPS LOCK** com apelo emocional para incentivar o compartilhamento rápido.", exemploMentira: "**MUITO CUIDADO! COMER ARROZ DE ONTEM PODE MATAR!!!**", exemploVerdade: "Entenda a relação entre o armazenamento do arroz e o risco de intoxicação bacteriana"),
        Estudo(tituloEstudo: "Erros gramaticais e ortográficos", descricaoEstudo: "A presença de erros de grosseiros de portugues, a falta de coesão e a pontuação excessiva são sinais que exigem atenção.", exemploMentira: "**O GOVERMO VAI CONFICAR SUA POUPANÇA AMANA!!!!! COMO EVITAR VEJA...**", exemploVerdade: "Banco Central informa novas regras para o rendimento da poupança"),
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
