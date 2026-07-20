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
        VStack (spacing: sizeClass == .regular ? 170 : 120){
            CardEstudar()
            HStack (spacing: sizeClass == .regular ? 140 : 30){
                Button {
                    estudarManager.backCard()
                }
                label: {
                    HStack{
                        Image(systemName: "arrow.backward")
                        Text("Anterior")
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                }
                .buttonStyle(ButtonAnterior())
                .disabled(estudarManager.currentStudyIndex == 0)
                
                Button {
                    estudarManager.nextNew()
                }
                label: {
                    HStack{
                        Text("Próximo")
                        Image(systemName: "arrow.right")
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                }
                .buttonStyle(ButtonProximo())
                .disabled(estudarManager.isLastNew())
            }
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .padding(.top, sizeClass == .regular ? 110 : 110)

        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button {
                    router.restartNavigation()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
            ToolbarItem(placement: .title){
                Text("NOTÍCIAS")
                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 24 : 18))
                    .foregroundColor(Color(red: 0.54, green: 0.53, blue: 0.53))
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
