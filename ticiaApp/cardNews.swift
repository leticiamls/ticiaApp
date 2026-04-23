//
//  cardNews.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct cardNews: View {
    var body: some View {
        VStack (alignment: .leading){
            Image("cardImage")
                .resizable()
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            cardText.padding(.horizontal, 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .background(Color.gray)
        .shadow(radius: 12)
    }
    
    var cardText: some View {
        VStack (alignment: .leading){
            Text("Notícia")
                .font(.headline)
            Text("Texto da notícia")
                .foregroundStyle(Color(.secondaryLabel))
        }
    }
}

#Preview {
    cardNews()
}
