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
        VStack(spacing: 100){
            VStack{
                Text("Tícia!")
                    .font(Font.custom("Grandstander-Black", size: 96))
                    .foregroundStyle(Color.blackTícia)
                    .kerning(-4)
                    .frame(height: 45)
                Text("Teste seus conhecimentos sobre")
                    .font(Font.custom("Fredoka-Medium", size: 18))
                Text("Fake News!")
                    .font(Font.custom("Fredoka-SemiBold", size: 18))
            Image("tíciaResults")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 217, height: 200)
            }
            
            //botoes
                VStack(spacing: 30){
                    NavigationLink {
                        JogoNewsView()
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
                        EstudarView()
                    }
                    label: {
                        HStack{
                            Image(systemName: "book.fill")
                            Text("Estudar")
                        }
                        .padding(16)
                        .frame(width: 327)
                        .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
                    }
                    .tint(Color(.black))
                    .font(Font.custom("Fredoka-SemiBold", size: 24))
                }
            
            }
        }
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    ContentView()
}
