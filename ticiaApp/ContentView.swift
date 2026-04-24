//
//  ContentView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
        VStack(spacing: 225){
            VStack{
                Text("Tícia!")
                    .font(Font.custom("Grandstander-Black", size: 96))
                    .foregroundColor(Color("Black"))
                    .kerning(-4)
                Text("Teste seus conhecimentos sobre")
                    .font(Font.custom("Fredoka-Medium", size: 18))
                Text("Fake News!")
                    .font(Font.custom("Fredoka-SemiBold", size: 18))
            }
                VStack(spacing: 30){
                    NavigationLink {
                        JogarView()
                    }
                    label: {
                        HStack{
                            Image(systemName: "gamecontroller.fill")
                            Text("Jogar")
                        }
                        .padding(10)
                        .frame(width: 317)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(.black))
                    .font(Font.custom("Fredoka-SemiBold", size: 24))
                    
                    NavigationLink {
                        cardNews()
                    }
                    label: {
                        HStack{
                            Image(systemName: "play.fill")
                            Text("Continuar Jogo")
                        }
                        .padding(10)
                        .frame(width: 317)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(.black))
                    .font(Font.custom("Fredoka-SemiBold", size: 24))

                    NavigationLink {
                        EstudarView()
                    }
                    label: {
                        HStack{
                            Image(systemName: "book.fill")
                            Text("Estudar")
                        }
                        .padding(10)
                        .frame(width: 317)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(.black))
                    .font(Font.custom("Fredoka-SemiBold", size: 24))

                }
            }
        }
    }
}

#Preview {
    ContentView()
}
