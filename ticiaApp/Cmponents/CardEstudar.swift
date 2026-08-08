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
    let usedDimension: Double
    
    var body: some View {
        let titleSize = usedDimension * 0.05
        let descriptionSize = usedDimension * 0.035
        let subheadlineSize = usedDimension * 0.03
        let captionSize = usedDimension * 0.045

        VStack (alignment: .center) {
            GroupBox{
                VStack(alignment: .center, spacing: usedDimension * 0.1){
                    VStack(alignment: .center, spacing: usedDimension * 0.01){
                        Text(estudarManager.currentStudy.tituloEstudo)
                            .font(
                                Font.custom(
                                    "Fredoka-SemiBold",
                                    size: sizeClass == .regular ? titleSize : usedDimension * 0.09,
                                    relativeTo: .title
                                )
                            )
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(estudarManager.currentStudy.descricaoEstudo)
                            .font(
                                Font.custom("Fredoka-Regular", size: sizeClass == .regular ? descriptionSize : usedDimension * 0.05, relativeTo: .body)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(.blackTicia))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    VStack(alignment: .leading, spacing: usedDimension * 0.03){
                        HStack (spacing: usedDimension * 0.02){
                            Image(systemName: "x.circle.fill").foregroundColor(.red)
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? captionSize : usedDimension * 0.07, relativeTo: .caption))
                            Text(estudarManager.currentStudy.exemploMentira)
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? subheadlineSize : usedDimension * 0.05, relativeTo: .subheadline))
                                .minimumScaleFactor(0.8)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        HStack (spacing: usedDimension * 0.02){
                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? captionSize : usedDimension * 0.07, relativeTo: .caption))
                            Text(estudarManager.currentStudy.exemploVerdade)
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? subheadlineSize : usedDimension * 0.05, relativeTo: .subheadline))
                                .tint(.blackTicia)
                                .fixedSize(horizontal: false, vertical: true)
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
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

