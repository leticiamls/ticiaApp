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
        GeometryReader{ geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let userDimensions = min(width, height)

            VStack (alignment: .center) {
                GroupBox{
                    VStack(alignment: .center, spacing: userDimensions * 0.08){
                        VStack(alignment: .center, spacing: userDimensions * 0.01){
                            Text(estudarManager.currentStudy.tituloEstudo)
                                .font(Font.custom("Fredoka-SemiBold", size: userDimensions * 0.1, relativeTo: .title))
                                .multilineTextAlignment(.center)

                                .fixedSize(horizontal: false, vertical: true)
                            Text(estudarManager.currentStudy.descricaoEstudo)
                                .font(Font.custom("Fredoka-Regular", size: userDimensions * 0.065, relativeTo: .body))
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundStyle(Color(.blackTicia))
                        }
                        VStack(alignment: .leading, spacing: userDimensions * 0.05){
                            HStack{
                                Image(systemName: "x.circle.fill").foregroundColor(.red)
                                    .font(Font.custom("Fredoka-Regular", size: userDimensions * 0.07, relativeTo: .caption))
                                Text(estudarManager.currentStudy.exemploMentira)
                                    .font(Font.custom("Fredoka-Medium", size: userDimensions * 0.06, relativeTo: .subheadline))
                                    .minimumScaleFactor(0.8)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            HStack{
                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                    .font(Font.custom("Fredoka-Medium", size: userDimensions * 0.07, relativeTo: .caption))
                                Text(estudarManager.currentStudy.exemploVerdade)
                                    .font(Font.custom("Fredoka-Medium", size: userDimensions * 0.06, relativeTo: .subheadline))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .tint(.blackTicia)
                            }
                        }

                        .multilineTextAlignment(.leading)
                    }

                }
                .padding(.horizontal, sizeClass == .regular ? 27 : 16)
                .padding(.vertical, sizeClass == .regular ? 35 : 20)
                .background(RoundedRectangle(cornerRadius: 25)
                    .fill(Color.backgroundCard)
                    .stroke(Color(.lightGray), lineWidth: 1.5))
                .foregroundStyle(Color.blackTicia)
                .backgroundStyle(Color.clear)
            }
        }
    }
}
