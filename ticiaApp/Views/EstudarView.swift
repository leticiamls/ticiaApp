//
//  EstudarView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

struct EstudarView: View {
    @Environment(Router.self) var router: Router
    @Environment(CardManager.self) var cardManager: CardManager

    
    var body: some View {
        VStack{
            Spacer()
            CardEstudar()
            Spacer()
            HStack (spacing: 30){
                Button {
                    cardManager.backCard()
                }
                label: {
                    HStack{
                        Image(systemName: "arrow.backward")
                        Text("Anterior")
                    }
                }
                .buttonStyle(ButtonAnterior())
                .disabled(cardManager.currentStudyIndex == 0)
                
                Button {
                    cardManager.nextNew()
                }
                
                label: {
                    HStack{
                        Text("Próximo")
                        Image(systemName: "arrow.right")
                    }
                }
                .buttonStyle(ButtonProximo())
                .disabled(cardManager.isLastNew())

                
            }
        }
        .toolbar{
                ToolbarItem(placement: .title){
                    Button(action: {
                        router.goTo(.MenuView)
                    },
                           label: {
                        Text("ESTUDAR")
                            .font(Font.custom("Fredoka-Medium", size: 16))
                            .kerning(1)
                    })
                }
            }
            .frame(height: 670)
        
    }
}

#Preview {
    @Previewable @State var router = Router()
    @Previewable @State var cardManager = CardManager()


    EstudarView()
        .environment(router)
        .environment(cardManager)
}
