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
        VStack (spacing: sizeClass == .regular ? 170 : 150){
            CardEstudar()
            HStack (spacing: sizeClass == .regular ? 140 : 50){
                Button {
                    estudarManager.backCard()
                }
                label: {
                    HStack{
                        Image(systemName: "arrow.backward")
                        Text("Anterior")
                    }
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
                }
                .buttonStyle(ButtonProximo())
                .disabled(estudarManager.isLastNew())
                
                
            }
        }
        .padding(.top, sizeClass == .regular ? 110 : 110)

        .toolbar{
            ToolbarItem(placement: .title){
                Text("ESTUDAR")
                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 24 : 16))
                    .foregroundColor(Color(red: 0.54, green: 0.53, blue: 0.53))

            }
        }
    }
    
}

#Preview {
    @Previewable @State var router = Router()
    @Previewable @State var estudarManager = EstudarManager()
    
    
    EstudarView()
        .environment(router)
        .environment(estudarManager)
}
