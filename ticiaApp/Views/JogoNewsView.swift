//
//  JogoNewsView.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct JogoNewsView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    @Environment(Router.self) var router: Router
    
    @State private var presentPopup: Bool = false
    @State private var isAcepted: Bool = false
    
    
   
    var body: some View {
        VStack {
            HStack (spacing: 28){
                //                Gauge(value: progressGame){
                //                    //
                //                }
                Gauge(value: gameManager.progress){
                    
                }
                .frame(minWidth: 180)
                .tint(Color(.black))
                HStack (spacing: 16){
                    HStack{
                        Image(systemName: "hand.thumbsup.fill")
                            .frame(width: 10)
                        Text("\(Int(gameManager.confiancaPoints))%")
                    }
                    .foregroundStyle(Color.greenTicia)
                    HStack{
                        Image(systemName: "exclamationmark.triangle.fill")
                            .frame(width: 8)
                        Text("\(Int(gameManager.caosPoints))%")
                    }
                    .foregroundStyle(Color(.red))
                }
            }
            .position(x: 180, y: 0)
            .padding(18)
            .font(Font.system(size: 16, weight: .bold))
            .frame(width: 402, height: 40)
            
            VStack (spacing: 90){
                CardJogo()
                
                HStack (spacing: 30){
                    Button {
                        isAcepted = false
                        withAnimation {
                            presentPopup.toggle()
                        }
                    }
                    label: {
                        HStack{
                            Image(systemName: "xmark")
                            Text("Excluir")
                        }
                    }
                    .buttonStyle(ButtonDelete())
                    
                    Button {
                        isAcepted = true
                        withAnimation {
                            presentPopup.toggle()
                        }
                    }
                    label: {
                        HStack{
                            Image(systemName: "checkmark")
                            Text("Publicar")
                        }
                    }
                    .buttonStyle(ButtonPublish())
                    
                    
                }
                .font(Font.custom("Fredoka-Semibold", size: 24))
                
            }
            .toolbar{
                ToolbarItem(placement: .title){
                    Button(action: {
                        router.goTo(.MenuView)
                        gameManager.caosPoints = 0
                        gameManager.confiancaPoints = 0
                        gameManager.progress = 0
                    },
                           label: {
                        Text("NOTÍCIAS")
                            .font(Font.custom("Fredoka-Medium", size: 16))
                            .kerning(1)
                    })
                }
            }
            .frame(height: 670)
        }
        .overlay {
            if presentPopup {
                ZStack {
                    Color.black.opacity(0.3).onTapGesture {
                        withAnimation {
                            presentPopup.toggle()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                }


                @Bindable var isTrue = gameManager
                PopUpView(
                    presentPopup: $presentPopup,
                    isTrue: gameManager.currentNew?.isTrue ?? false,
                    isAcepted: $isAcepted
                )
                    .onDisappear {
                        if gameManager.isLastNew() {
                            router.goTo(.ResultView)
                        }
                        gameManager.nextNew()
                    }
                    .transition(.scale)
            }
        }
        
        .ignoresSafeArea(.all)
        

    }
}

#Preview {
    @Previewable @State var gameManager = GameManager()
    @Previewable @State var router = Router()
    
    JogoNewsView()
        .onAppear{
            gameManager.startGame()
        }
        .environment(gameManager)
        .environment(router)
}
