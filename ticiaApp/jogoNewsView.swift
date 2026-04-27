//
//  jogoNewsView.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct cardNews: View {
    @State private var progressGame: Double = 0.80

    var body: some View {
        NavigationStack {
        HStack{
            Gauge(value: progressGame){
                //
            }
            .tint(Color(.black))
            HStack{
                HStack{
                    Image(systemName: "hand.thumbsup.fill")
                    Text("80%")
                }
                .foregroundStyle(Color(.green))
                HStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("20%")
                }
                .foregroundStyle(Color(.red))
            }
            .frame(maxWidth: 144)
        }
            .padding(18)
            .font(Font.system(size: 16, weight: .bold))
            .frame(width: 402, height: 40)
        
        Spacer()
            .frame(height: 10)
        
        VStack (spacing: 90){
            VStack {
                GroupBox{
                    Image("cardImage")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    VStack(alignment: .leading){
                        Text(newsList[0].manchete)
                            .font(Font.custom("Fredoka-SemiBold", size: 24))
                        Text(newsList[0].texto)
                            .font(Font.custom("Fredoka-Regular", size: 16))
                            .frame(maxHeight: 100)
                            .foregroundStyle(Color(.secondaryLabel))
                        
                        
                        VStack(alignment: .leading){
                            Text("Fonte: \(newsList[0].fonte)")
                                .font(Font.custom("Fredoka-Regular", size: 15))
                        }
                    }
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .stroke(Color(.lightGray), lineWidth: 1))
                .foregroundColor(Color("Black"))
                .frame(maxWidth: 327 , maxHeight: 393)
                .backgroundStyle(Color.clear)
            }
            
            
            HStack (spacing: 30){
                Button {
                    //botao para publicar a noticia
                }
                label: {
                    HStack{
                        Image(systemName: "checkmark")
                        Text("Publicar")
                    }
                    .padding(10)
                    .frame(width: 150)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(.black))
                .font(Font.system(size: 24, weight: .bold))
                
                Button {
                    //botao para excluir a noticia
                }
                label: {
                    HStack{
                        Image(systemName: "xmark")
                        Text("Excluir")
                    }
                    .padding(18)
                    .frame(width: 150)
                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
                }
                .tint(Color(.black))
                .font(Font.system(size: 24, weight: .bold))
            }
        }
            
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button(action: {
                            
                            //
                        }, label: {
                            Image(systemName: "chevron.left")
                        })
                    }
                    
                    ToolbarItem(placement: .title){
                        Button(action: {
                            
                            //
                        }, label: {
                            Text("NOTÍCIA 1 DE 10")
                                .font(Font.custom("Fredoka-Medium", size: 16))
                                .kerning(1)
                        })
                    }
                }
                .frame(height: 720)
        }
    }
}

#Preview {
    cardNews()
}
