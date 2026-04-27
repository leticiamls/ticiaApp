//
//  popUpView.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct popUpView: View {
    var body: some View {
//        NavigationStack{
            ZStack{
                GroupBox{
                    VStack{
                        Text("Vixi... Essa é Fake")
                            .font(Font.custom("Fredoka-SemiBold", size: 36))
                        Image("tíciaResults")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        VStack (alignment: .leading){
                            Text("Essa tava com toda cara de ser fake:")
                                .font(Font.custom("Fredoka-Regular", size: 20))
                            Text("título em CAPS LOCK, não cita fonte confiável, faz apelo emocional...")
                                .font(Font.custom("Fredoka-Semibold", size: 20))
                            Text("Não publique notícias assim!")
                                .font(Font.custom("Fredoka-Regular", size: 20))
                        }
                    }
                    
                    Spacer()
                        .frame(height: 8)
                        HStack{
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(Font.custom("Fredoka-Semibold", size: 20))
                            
                            Text("+ 10 de Caos")
                                .font(Font.custom("Fredoka-Semibold", size: 24))
                        }
                    .foregroundStyle(Color(.red))
                    .frame(width: 324)
                    
                    Button {
                        //botao para publicar a noticia
                    }
                    label: {
                        HStack{
                            Text("Próxima")
                                .font(Font.custom("Fredoka-Semibold", size: 24))
                                .foregroundColor(Color(.white))
                            Image(systemName: "arrow.right")
                                .foregroundColor(Color(.white))
                                .font(Font.custom("Fredoka-Semibold", size: 24))
                        }
                        .padding(10)
                        .frame(width: 317)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(.red))
                    
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .stroke(Color(.lightGray), lineWidth: 1))
                .foregroundColor(Color("Black"))
                .frame(maxWidth: 370, maxHeight: 575)
                .backgroundStyle(Color.clear)
            }
        }
    }
//}

#Preview {
    popUpView()
}
