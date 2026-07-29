//
//  EstudarView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

struct EstudarView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(Router.self) var router: Router
    @Environment(EstudarManager.self) var estudarManager: EstudarManager

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            
            let userDimensions = min(width, height)
            
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack (spacing: sizeClass == .regular ? 140 : 30) {
                    Spacer()
                    CardEstudar()
                        .frame(
                            width: width * (sizeClass == .regular ? 0.7 : 0.85),
                            height: height * (sizeClass == .regular ? 0.5 : 0.58),
                        )
                    Spacer()
                    //botoes
                    HStack(spacing: sizeClass == .regular ? 140 : 30) {
                        Button {
                            estudarManager.backCard()
                        } label: {
                            HStack {
                                Image(systemName: "arrow.backward")
                                Text("Anterior")
                            }
                            .lineLimit(1)
                            .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? width * 0.04 : width * 0.06))
                        }
                        .buttonStyle(ButtonAnterior())
                        .disabled(estudarManager.currentStudyIndex == 0)
                        
                        Button {
                            estudarManager.nextNew()
                        } label: {
                            HStack {
                                Text("Próximo")
                                Image(systemName: "arrow.right")
                            }
                            .lineLimit(1)
                            .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? width * 0.04 : width * 0.06))
                        }
                        .buttonStyle(ButtonProximo())
                        .disabled(estudarManager.isLastNew())
                    }
                    .padding(.horizontal, width * 0.05)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button {
                    router.restartNavigation()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
            ToolbarItem(placement: .title){
                Text("ESTUDAR")
                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 18))
                    .foregroundColor(Color.blackTicia)
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    @Previewable @State var router = Router()
    @Previewable @State var estudarManager = EstudarManager()

    EstudarView()
        .environment(router)
        .environment(estudarManager)
}
