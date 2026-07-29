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
            let height = geo.size.height
            
            //TODO: USAR ISSO NOS GEOMETRYREADER QUE TIVER
            let usedDimension = min(width, height)

            VStack (alignment: .leading) {
                GroupBox{
                    Image(gameManager.currentNew?.foto ?? "Sem valor")
                        .resizable()
                        .aspectRatio(2/1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: sizeClass == .regular ? 15 : 10))
                    VStack(alignment: .leading, spacing: usedDimension * 0.02){
                        VStack(alignment: .leading, spacing: usedDimension * 0.02){
                            Text(gameManager.currentNew?.titulo ?? "Sem valor")
                                .font(
                                    Font.custom(
                                        "Fredoka-SemiBold",
                                        size: usedDimension * 0.078,
                                        relativeTo: .title
                                    )
                                )
                                .fixedSize(horizontal: false, vertical: true)
                            Text(gameManager.currentNew?.resumo ?? "Sem valor")
                                .font(
                                    Font.custom(
                                        "Fredoka-Regular",
                                        size: sizeClass == .regular ? usedDimension * 0.048 : usedDimension * 0.05,
                                        relativeTo: .body
                                    )
                                )
                                .lineLimit(5)
                        }
                        Spacer()
                        Text("**Fonte:** \(gameManager.currentNew?.fonte ?? "Sem valor")")
                            .font(
                                Font.custom(
                                    "Fredoka-Regular",
                                    size: usedDimension * 0.05,
                                    relativeTo: .footnote
                                )
                            )
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.bottom, sizeClass == .regular ? 8 : 0)
            .padding(.trailing, sizeClass == .regular ? 20 : 0)
            .padding(.leading, sizeClass == .regular ? 20 : 0)
            .padding(.top, sizeClass == .regular ? 24 : 0)
            .background(RoundedRectangle(cornerRadius: sizeClass == .regular ? 20 : 20)
                .fill(Color.background)
                .stroke(Color(.lightGray), lineWidth: 1.5))
            .backgroundStyle(Color.clear)
        }
    }
}


