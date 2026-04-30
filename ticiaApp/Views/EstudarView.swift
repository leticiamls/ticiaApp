//
//  EstudarView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

struct EstudarView: View {
    var body: some View {
        
        VStack{
            Spacer()
            VStack (alignment: .center){
                GroupBox{
                    VStack(alignment: .center, spacing: 24){
                        HStack{
                            Text("Títulos Sensacionalistas")
                                .frame(
                                    maxWidth: .infinity)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(Font.custom("Fredoka-SemiBold", size: 28))
                        }.multilineTextAlignment(.center)
                        
                        Text("Uso de títulos chamativos e letras garrafais com apelo emocional para incentivar o compartilhamento rápido.")
                            .font(Font.custom("Fredoka-Regular", size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxHeight: 100)
                            .foregroundStyle(Color(.blackTicia))
                            .multilineTextAlignment(.center)
                        
                        VStack(alignment: .leading, spacing: 50){
                            HStack{
                                Image(systemName: "x.circle.fill").foregroundColor(.red)
                                Text("MUITO CUIDADO! COMER ARROZ DE ONTEM MATA")
                                    .font(Font.custom("Fredoka-Medium", size: 18))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxHeight: 40)
                            }
                            HStack{
                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                Text("Entenda a relação entre o armazenamento do arroz e o risco de intoxicação bacteriana")
                                    .font(Font.custom("Fredoka-Medium", size: 18))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxHeight: 22)
                            }
                        }
                    }
                }
                .padding(.bottom, 40)
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .stroke(Color(.lightGray), lineWidth: 1))
                .foregroundStyle(Color.blackTicia)
                .frame(maxWidth: 327 , maxHeight: 393)
                .backgroundStyle(Color.clear)
            }
            
            Spacer()
            HStack (spacing: 30){
                Button {
                }
                label: {
                    HStack{
                        Image(systemName: "arrow.backward")
                        Text("Anterior")
                    }
                }
                .buttonStyle(ButtonAnterior())
                
                Button {
                    
                }
                
                label: {
                    HStack{
                        Text("Próximo")
                        Image(systemName: "arrow.right")
                    }
                }
                .buttonStyle(ButtonProximo())
                
                
            }
        }
        
    }
}

#Preview {
    EstudarView()
}
