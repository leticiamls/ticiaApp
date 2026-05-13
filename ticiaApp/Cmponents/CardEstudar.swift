//
//  CardEstudar.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

struct CardEstudar: View {
    
    @Environment(EstudarManager.self) var estudarManager: EstudarManager
    
    var body: some View {
        VStack (alignment: .center){
            GroupBox{
                VStack(alignment: .center, spacing: 24){
                    HStack{
                        Text(estudarManager.currentStudy.tituloEstudo)
                        
                            .frame(
                                maxWidth: .infinity)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(Font.custom("Fredoka-SemiBold", size: 28))
                    }.multilineTextAlignment(.center)
                    
                    Text(estudarManager.currentStudy.descricaoEstudo)
                        .font(Font.custom("Fredoka-Regular", size: 20))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxHeight: 200)
                        .foregroundStyle(Color(.blackTicia))
                        .multilineTextAlignment(.center)
                    
                    
                    VStack(alignment: .leading, spacing: 50){
                        HStack{
                            Image(systemName: "x.circle.fill").foregroundColor(.red)
                            Text(estudarManager.currentStudy.exemploMentira)
                            
                                .font(Font.custom("Fredoka-Medium", size: 18))
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxHeight: 40)
                        }
                        HStack{
                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                            Text(estudarManager.currentStudy.exemploVerdade)
                                .font(Font.custom("Fredoka-Medium", size: 18))
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxHeight: 22)
                                .tint(.black)
                            
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
        
    }
}

