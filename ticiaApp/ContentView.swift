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
                    .font(Font.system(size: 96, weight: .bold))
                    .foregroundColor(Color("Black"))
                Text("Teste seus conhecimentos sobre fake news")
                    .font(Font.system(size: 16, weight: .bold))
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
                    .font(Font.system(size: 24, weight: .bold))
                    
                    NavigationLink {
                        JogarView()
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
                    .font(Font.system(size: 24, weight: .bold))
                    
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
                    .font(Font.system(size: 24, weight: .bold))
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
