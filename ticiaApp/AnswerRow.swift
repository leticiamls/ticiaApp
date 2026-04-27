//
//  VerdadeiroRow.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//
import SwiftUI

struct AnswerRow: View {
    var answer: Resposta
    @State private var isSelected: Bool = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(hue: 0.71, saturation: 0.094, brightness: 0.711)
    
    var body: some View {
        Button {
            
        }
        label: {
            HStack{
                Image(systemName: "xmark")
                Text("Excluir")
                
                if isSelected {
                    
                    Image(systemName: answer.isCorrect ? "checkmark.square.fill" : "checkmark.square")
                        .foregroundColor( answer.isCorrect ? Color(.green) : Color(.red))
                }
            }
            .padding(18)
            .frame(width: 150)
            .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
            .foregroundColor(isSelected ? Color("AccentColor") : .gray)
            .shadow(color : isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y:0.5)
        }
        .tint(Color(.black))
        .font(Font.system(size: 24, weight: .bold))
    }
}

//struct AnswerRow_Previews: PreviewProvider {
//    static var previews: some View {
//        AnswerRow(answer: Resposta(texto: "Single", isCorrect: false))
//    }
//}

#Preview {
    AnswerRow(answer: Resposta(texto: "Single", isCorrect: false))
}
