//
//  ExcluirPublicarLogica.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

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

    func startGame() {
        listaNoticiasJogo = getNewsFromJson().shuffled().prefix(10).map(\.self)
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
