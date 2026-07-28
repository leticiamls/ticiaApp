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
            VStack (alignment: .center) {
                GroupBox{
                    VStack(alignment: .center, spacing: width * 0.08){
                        VStack(alignment: .center, spacing: 4){
                            Text(estudarManager.currentStudy.tituloEstudo)
                                .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? width * 0.09 : width * 0.1, relativeTo: .title))
                                .multilineTextAlignment(.center)

                                .fixedSize(horizontal: false, vertical: true)
                            Text(estudarManager.currentStudy.descricaoEstudo)
                                .font(Font.custom("Fredoka-Regular", size: sizeClass == .regular ? width * 0.065 : width * 0.06, relativeTo: .body))
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundStyle(Color(.black))
                        }
                        VStack(alignment: .leading, spacing: 30){
                            HStack{
                                Image(systemName: "x.circle.fill").foregroundColor(.red)
                                    .font(Font.custom("Fredoka-Regular", size: sizeClass == .regular ? width * 0.07 : width * 0.08, relativeTo: .caption))
                                Text(estudarManager.currentStudy.exemploMentira)
                                    .font(Font.custom("Fredoka-Medium", size: width * 0.06, relativeTo: .subheadline))
                                    .minimumScaleFactor(0.8)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            HStack{
                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                    .font(Font.custom("Fredoka-Medium", size: width * 0.07, relativeTo: .caption))
                                Text(estudarManager.currentStudy.exemploVerdade)
                                    .font(Font.custom("Fredoka-Medium", size: width * 0.06, relativeTo: .subheadline))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .tint(.black)
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
