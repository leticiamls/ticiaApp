//
//  VerdadeiroRow.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//
import SwiftUI

struct AnswerRow: View {
    
    @State private var showSheet = false
    
    var answer: Resposta
//    @State private var isSelected: Bool = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        VStack{
//            Button {
//                showSheet.toggle()
//            }
//            label: {
//                HStack{
//                    Image(systemName: "checkmark")
//                    Text("Publicar")
//                }
//                .padding(10)
//                .frame(width: 150)
//            }
//            .buttonStyle(.borderedProminent)
//            .tint(Color(.black))
//            .font(Font.system(size: 24, weight: .bold))
//            
//            
            Button {
                showSheet.toggle()
            }
            label: {
                HStack{
                    Image(systemName: "xmark")
                    Text(answer.texto)
                    
//                    if isSelected {
//                        
//                        Image(systemName: "xmark")
//                            .sheet(isPresented: $showSheet, content: {
//                                Rectangle()
//                                    .fill(.pink)
//                            })
//                    }
                }
                .padding(18)
                .frame(width: 150)
                .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
//                .foregroundColor(isSelected ? Color("AccentColor") : .gray)
//                .shadow(color : isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y:0.5)
//                .onTapGesture{
//                    isSelected = true
//                }
            }
            .tint(Color(.black))
            .font(Font.system(size: 24, weight: .bold))
        }.fullScreenCover(isPresented: $showSheet, content: {
        
            VStack{
                if answer.isCorrect {
                    Text("Resposta correta")
                }
                else {
                    Text("Resposta incorreta")
                }
            }
        })
    }
}


#Preview {
    AnswerRow(answer: Resposta(texto: "Single", isCorrect: false))
}
