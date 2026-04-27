//
//  cardNews.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct news {
    let manchete: String;
    let texto: String;
    let fonte: String;
}

var newsList: [news] = [
    news(manchete: "URGENTE!! Vacina CAUSA AUTISMO em CRIANÇAS!!", texto: "COMPARTILHE ANTES QUE REMOVAM!! Fontes ciemtificas afirma que vacinas causa AUTISMO!! Médicos NÃO querem que você saiba disso!! COMPARTILHE com AMIGOS e FAMÍLIA!!", fonte: "Grupo do WhatsApp"),
    news(manchete: "Notícia 2", texto: "Texto da notícia 2", fonte: "Grupo do WhatsApp"),
    news(manchete: "Notícia 3", texto: "Texto da notícia 3", fonte: "Grupo do WhatsApp"),
]

//struct cardNews: View {
//    var body: some View {
//        
//        VStack{
//            GroupBox{
//                Image("cardImage")
//                    .resizable()
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .shadow(radius: 12)
//                    .padding(0)
//                VStack(alignment: .leading){
//                    Text(newsList[0].manchete)
//                        .font(Font.custom("Fredoka-SemiBold", size: 24))
//                    ScrollView(.vertical, showsIndicators: true) {
//                        Text(newsList[0].texto)
//                            .font(Font.custom("Fredoka-Regular", size: 16))
//                    }
//                    .foregroundStyle(Color(.secondaryLabel))
//                    
//                    Spacer()
//                    
//                    VStack(alignment: .leading){
//                        Text("Fonte: \(newsList[0].fonte)")
//                            .font(.subheadline)
//                            .bold()
//                            .font(Font.custom("Fredoka-Regular", size: 12))
//                    }
//                }
//            }
//        }
//        .background(Color(.white))
//        .foregroundColor(Color("Black"))
//        .clipShape(RoundedRectangle(cornerRadius: 15))
//        .frame(maxWidth: .infinity , maxHeight: .infinity)
//        .backgroundStyle(Color.clear)
//        .padding(.horizontal, 37)
//        .padding(.top, 167).padding(.bottom, 200)
//    }
//    
//}
//
//
//#Preview {
//    cardNews().background(Color.black)
//}
