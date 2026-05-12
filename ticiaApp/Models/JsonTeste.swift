//
//  JsonTeste.swift
//  ticiaApp
//
//  Created by User on 28/04/26.
//
import Foundation
import SwiftUI

// MARK: - Noticia
struct Noticia: Codable {
    let titulo, resumo, fonte, foto, justificativaErro, justificativaAcerto : String
    var isTrue: Bool
    static let listaNoticias: [Noticia] = Bundle.main.decode(file: "News.json")
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        // 1. Localiza o arquivo
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Não foi possível encontrar \(file) no projeto.")
        }
        
        // 2. Carrega os dados brutos (Data)
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Não foi possível carregar \(file) do projeto.")
        }
        
        let decoder = JSONDecoder()
        
        // 3. Tenta decodificar o JSON para o tipo T
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Falha ao decodificar \(file). Verifique se o JSON combina com sua Struct.")
        }
        
        return loadedData
    }
}
