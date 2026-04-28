//
//  PopUpCards.swift
//  ticiaApp
//
//  Created by User on 28/04/26.
//

import SwiftUI

//card da pagina de resultado
struct CardResultsFinal: GroupBoxStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.content
                .padding(EdgeInsets(top: 00, leading: 16, bottom: 00, trailing: 16))
        }
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .stroke(Color(.lightGray), lineWidth: 1.7)
        )
    }
}


//estilo de pop-up
struct PopUp: GroupBoxStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.content
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .stroke(Color(.lightGray), lineWidth: 1))
        .foregroundStyle(Color.blackTicia)
        .frame(maxWidth: 370, maxHeight: 575)
        .backgroundStyle(Color.clear)
    }
}

