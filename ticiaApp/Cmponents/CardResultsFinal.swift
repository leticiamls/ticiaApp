//
//  CardResultsFinal.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

//card da pagina de resultado
struct CardResultsFinal: GroupBoxStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.content
                .padding(
                    EdgeInsets(top: 00, leading: 16, bottom: 00, trailing: 16)
                )
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .stroke(Color(.lightGray), lineWidth: 1.7)
        )
    }
}


