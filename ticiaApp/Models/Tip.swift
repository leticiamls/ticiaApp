//
//  Tip.swift
//  ticiaApp
//
//  Created by marquiros on 14/07/26.
//

import Foundation
import TipKit

struct TipGame: Tip {
    var title: Text {
        Text("Indicadores")
    }
    
    var message: Text? {
        Text("Excluir e Publicar geram Confiança ou Caos.")
    }
    
    var image: Image? {
        Image("ticiaTip")
    }
}
