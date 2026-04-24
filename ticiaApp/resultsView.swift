//
//  resultsView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct resultsView: View {
    @State private var pointsUser: Double = 0.70
    var body: some View {
        NavigationStack{
            //imagem e texto
           
                VStack(alignment: .center){
                    Image("tíciaResults")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    Text("Mandou muito bem!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("Você foi tão bem que eu acho que posso te considerar um... Aprendiz")
                        .multilineTextAlignment(.center)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .padding(EdgeInsets(top: 40, leading: 00, bottom: 30, trailing: 00))

                //resultados
            GroupBox{
                VStack{
                    HStack{
                        Image(systemName: "hand.thumbsup.fill")
                        Text("Confiança")
                        Spacer()
                        Text("70%")
                    }
                    .foregroundStyle(Color(.green))
                    Gauge(value: pointsUser){
                        
                    }
                    .tint(Color(.green))
                }
                .padding(EdgeInsets(top: 25, leading: 00, bottom: 20, trailing: 00))

                Divider()
                
                VStack{
                    HStack{
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("Caos")
                        Spacer()
                        Text("20%")
                    }
                    .foregroundColor(Color(.red))
                    Gauge(value: pointsUser - 0.50){
                        
                    }
                    .tint(Color(.red))
                }
                .padding(EdgeInsets(top: 10, leading: 00, bottom: 30, trailing: 00))

            }
            .padding(EdgeInsets(top: 10, leading: 00, bottom: 30, trailing: 00))
            .groupBoxStyle(CardGroupBoxStyle())
            .padding(EdgeInsets(top: 00, leading: 16, bottom: 00, trailing: 16))
            .font(Font.system(size: 24, weight: .bold))
            Spacer()
            
            //botões
            VStack(spacing: 16){
                NavigationLink {
                    JogarView()
                }
                label: {
                    HStack{
                        Text("Jogar novamente")
                    }
                    .padding(10)
                    .frame(width: 340)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(.black))
                .font(Font.system(size: 24, weight: .bold))
                
                NavigationLink {
                    ContentView()
                }
                label: {
                    HStack{
                        Text("Voltar para o menu")
                    }
                    .padding(16)
                    .frame(width: 370)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .font(Font.system(size: 24, weight: .bold))

        }
            
        }
    }


#Preview {
    resultsView()
}

struct CardGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.content
                .padding(EdgeInsets(top: 00, leading: 16, bottom: 00, trailing: 16))
        }
        
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .stroke(Color(.lightGray), lineWidth: 3)
        )
    }
}
