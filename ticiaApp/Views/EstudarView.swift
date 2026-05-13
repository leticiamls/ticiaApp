//
//  EstudarView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

struct EstudarView: View {
    @Environment(Router.self) var router: Router
    @Environment(EstudarManager.self) var estudarManager: EstudarManager
    
    
    var body: some View {
        VStack{
            Spacer()
            CardEstudar()
            Spacer()
            HStack (spacing: 30){
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
        .toolbar{
            ToolbarItem(placement: .title){
                Text("ESTUDAR")
                    .font(Font.custom("Fredoka-Medium", size: 16))
            }
        }
        .frame(height: 670)
        
    }
}

#Preview {
    @Previewable @State var router = Router()
    @Previewable @State var estudarManager = EstudarManager()
    
    
    EstudarView()
        .environment(router)
        .environment(estudarManager)
}
