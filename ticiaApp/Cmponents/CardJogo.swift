//
//  CardJogo.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

struct CardJogo: View {
    @Environment(GameManager.self) var gameManager: GameManager
    
    var body: some View {
        
        VStack (alignment: .leading){
            GroupBox{
                Image(gameManager.currentNew?.foto ?? "Sem valor")
                    .resizable()
                    .frame(width: 300, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading){
                    Text(gameManager.currentNew?.titulo ?? "Sem valor")
                        .font(Font.custom("Fredoka-SemiBold", size: 20))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    Text(gameManager.currentNew?.resumo ?? "Sem valor")
                        .font(Font.custom("Fredoka-Regular", size: 16))
                        .frame(maxHeight: 100)
                        .foregroundStyle(Color(.secondaryLabel))
                    VStack(alignment: .leading){
                        Text("Fonte: \(gameManager.currentNew?.fonte ?? "Sem valor")")
                            .font(Font.custom("Fredoka-Regular", size: 15))
                    }
                }
            }
            
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(Color(.lightGray), lineWidth: 1))
            .foregroundStyle(Color.blackTicia)
            .frame(maxWidth: 327 , maxHeight: 393)
            .backgroundStyle(Color.clear)
        }
    }
}


