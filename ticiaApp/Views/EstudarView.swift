//
//  EstudarView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

struct EstudarView: View {
    @Environment(Router.self) var router: Router
    
    let estudosLista: [Estudo] = [Estudo(tituloEstudo: "a", descricaoEstudo: "a", exemploMentira: "a", exemploVerdade: "a"), Estudo(tituloEstudo: "b", descricaoEstudo: "b", exemploMentira: "c", exemploVerdade: "d")]

    
    var body: some View {
        VStack{
            Spacer()
            CardEstudar(estudos: estudosLista[1])
            Spacer()
            HStack (spacing: 30){
                Button {
                }
                label: {
                    HStack{
                        Image(systemName: "arrow.backward")
                        Text("Anterior")
                    }
                }
                .buttonStyle(ButtonAnterior())
                
                Button {
                    
                }
                
                label: {
                    HStack{
                        Text("Próximo")
                        Image(systemName: "arrow.right")
                    }
                }
                .buttonStyle(ButtonProximo())
                
            }
        }
        
        
    }
}

#Preview {
    @Previewable @State var router = Router()

    EstudarView()
        .environment(router)
}
