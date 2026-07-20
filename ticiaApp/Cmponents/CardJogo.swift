//
//  CardJogo.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

struct CardJogo: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(GameManager.self) var gameManager: GameManager
    
    var body: some View {
        
        VStack (alignment: .leading){
            GroupBox{
                Image(gameManager.currentNew?.foto ?? "Sem valor")
                    .resizable()
                    .frame(maxWidth: sizeClass == .regular ? .infinity : 300, maxHeight: sizeClass == .regular ? 200 : 150)
                    .clipShape(RoundedRectangle(cornerRadius: sizeClass == .regular ? 15 : 10))
                VStack(alignment: .leading, spacing: 18){
                    VStack(alignment: .leading, spacing: 4){
                        Text(gameManager.currentNew?.titulo ?? "Sem valor")
                            .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 28 : 18))
                            .minimumScaleFactor(0.5)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(gameManager.currentNew?.resumo ?? "Sem valor")
                            .frame(maxHeight: sizeClass == .regular ? 320 : 100, alignment: .top)
                            .lineLimit(sizeClass == .regular ? 6 : 4)
                            .font(Font.custom("Fredoka-Regular", size: sizeClass == .regular ? 24 : 16))
                            .minimumScaleFactor(0.9)
                            .foregroundStyle(Color(.secondaryLabel))
                    }
                        Text("**Fonte:** \(gameManager.currentNew?.fonte ?? "Sem valor")")
                        .font(Font.custom("Fredoka-Regular", size: sizeClass == .regular ? 24 : 15))
                        .fixedSize(horizontal: false, vertical: true)

                }
            }
            .padding(.bottom, sizeClass == .regular ? 8 : 0)
            .padding(.trailing, sizeClass == .regular ? 20 : 0)
            .padding(.leading, sizeClass == .regular ? 20 : 0)
            .padding(.top, sizeClass == .regular ? 24 : 0)
            .frame(maxWidth: sizeClass == .regular ? 450 : 327, maxHeight: sizeClass == .regular ? 550 : 393)
            .background(RoundedRectangle(cornerRadius: sizeClass == .regular ? 20 : 20)
                .fill(Color.white)
                .stroke(Color(.lightGray), lineWidth: 1.5))
            .foregroundStyle(Color.blackTicia)
         
            .backgroundStyle(Color.clear)
        }
    }
}


