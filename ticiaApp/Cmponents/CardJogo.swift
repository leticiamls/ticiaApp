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
        GeometryReader { geo in
            let width = geo.size.width
            
            VStack (alignment: .leading) {
                GroupBox{
                    Image(gameManager.currentNew?.foto ?? "Sem valor")
                        .resizable()
                        .aspectRatio(2/1,contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: sizeClass == .regular ? 15 : 10))
                    VStack(alignment: .leading, spacing: 18){
                        VStack(alignment: .leading, spacing: 4){
                            Text(gameManager.currentNew?.titulo ?? "Sem valor")
                                .font(Font.custom("Fredoka-SemiBold", size: width * 0.068, relativeTo: .title))
                                .fixedSize(horizontal: false, vertical: true)
                            Text(gameManager.currentNew?.resumo ?? "Sem valor")
                                .font(Font.custom("Fredoka-Regular", size: sizeClass == .regular ? width * 0.048 : width * 0.05, relativeTo: .body))
                                .lineLimit(5)
                                .foregroundStyle(Color(.secondaryLabel))
                        }
                        Spacer()
                        Text("**Fonte:** \(gameManager.currentNew?.fonte ?? "Sem valor")")
                            .font(Font.custom("Fredoka-Regular", size: width * 0.05, relativeTo: .footnote))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .stroke(Color(.lightGray), lineWidth: 1.5))
                .foregroundStyle(Color.blackTicia)
                .backgroundStyle(Color.clear)
            }
        }
    }
}


