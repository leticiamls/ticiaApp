//
//  CardEstudar.swift
//  ticiaApp
//
//  Created by marquiros on 13/05/26.
//

import SwiftUI

struct CardEstudar: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(EstudarManager.self) var estudarManager: EstudarManager
    
    var body: some View {
        VStack (alignment: .center){
            GroupBox{
                VStack(alignment: .center, spacing: sizeClass == .regular ? 55 : 48){
                    VStack (spacing: sizeClass == .regular ? 20 : 8){
                        Text(estudarManager.currentStudy.tituloEstudo)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 40 : 28))
                            .multilineTextAlignment(.center)
                        
                        Text(estudarManager.currentStudy.descricaoEstudo)
                            .font(Font.custom("Fredoka-Regular", size: sizeClass == .regular ? 28 : 20))
                            .fixedSize(horizontal: false, vertical: true)
                            
                            .foregroundStyle(Color(.blackTicia))
                            .multilineTextAlignment(.center)
                    }
                    VStack(alignment: .leading, spacing: sizeClass == .regular ? 30 : 30){
                        HStack{
                            Image(systemName: "x.circle.fill").foregroundColor(.red)
                                .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 32 : 24))
                            Text(estudarManager.currentStudy.exemploMentira)
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 22 : 18))
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxHeight: 40)
                        }
                        HStack{
                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 32 : 24))
                            Text(estudarManager.currentStudy.exemploVerdade)
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 24 : 18))                                .fixedSize(horizontal: false, vertical: true)
                                .tint(.black)
                            
                        }
                    }
                }
            }
            .padding(.bottom, sizeClass == .regular ? 20 : 10)
            .padding(.trailing, sizeClass == .regular ? 20 : 0)
            .padding(.leading, sizeClass == .regular ? 20 : 0)
            .background(RoundedRectangle(cornerRadius: sizeClass == .regular ? 30 : 20)
                .fill(Color.backgroundCard)
                .stroke(Color(.lightGray), lineWidth: 1.5))
            .foregroundStyle(Color.blackTicia)
            .frame(maxWidth: sizeClass == .regular ? 450 : 327, maxHeight: sizeClass == .regular ? 500 : 393)
            .backgroundStyle(Color.backgroundCard)
        }
        
    }
}

