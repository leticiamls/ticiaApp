//
//  Estudo.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

struct Estudo: Identifiable {
    var id: UUID = UUID()
    var tituloEstudo: String
    var descricaoEstudo: LocalizedStringKey
    var exemploMentira: LocalizedStringKey
    var exemploVerdade: LocalizedStringKey
}

