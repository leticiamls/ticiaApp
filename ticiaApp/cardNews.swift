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
    news(manchete: "URGENTE!! Vacina CAUSA AUTISMO em CRIANÇAS!!", texto: "COMPARTILHE ANTES QUE REMOVAM!! Fontes ciemtificas afirma que vacinas causa AUTISMO!! Médicos NÃO querem que você saiba disso!! COMPARTILHE com AMIGOS aaaaaaaaaaaaaaaaaaaaaaaaaLWIRFHIEHRFIUEIHRFIUHEDISRKFJDKLSRHFUKEDRHFUIOEHRe FAMÍLIA!!", fonte: "Grupo do WhatsApp"),
    news(manchete: "Notícia 2", texto: "Texto da notícia 2", fonte: "Grupo do WhatsApp"),
    news(manchete: "Notícia 3", texto: "Texto da notícia 3", fonte: "Grupo do WhatsApp"),
]

struct cardNews: View {
    var body: some View {
        
        VStack{
            GroupBox{
                Image("cardImage")
                    .resizable()
                    .frame(width: 295, height: 173)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 12)
                    .padding(0)
                VStack(alignment: .leading){
                    Text(newsList[0].manchete)
                        .font(.headline)
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        Text(newsList[0].texto)
                            .font(.footnote)
                    }
                    .frame(height: 91)
                    .foregroundStyle(Color(.secondaryLabel))
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Fonte: \(newsList[0].fonte)")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(Color(.secondaryLabel))
                }
                    
                
            }
            .frame(width: 327, height: 411)
            .backgroundStyle(Color.clear)
            .padding(0)
        }
        .background(Color(.pink))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 327, height: 411)
    }
}


#Preview {
    cardNews()
}
