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
        ZStack {
            VStack {
                HStack (spacing: 28){
                    WordProgressBar(
                        atual: (gameManager.currentNewIndex ?? 0) + 1,
                        total: gameManager.totalNoticias
                    )
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
                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                .font(Font.system(size: 16, weight: .bold))
                
                VStack (spacing: 90){
                    //card das noticias
                    CardJogo()
                    //botoes
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
                    if #available(iOS 26.0, *) {
                        ToolbarItem(placement: .topBarLeading){
                            Button {
                                router.restartNavigation()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(Font.system(size: 16, weight: .bold))
                            }
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .background(Color.blackTicia)
                            .clipShape(Capsule())
                            .foregroundStyle(Color.white)
                            .tint(Color(.black))
                        }
                        .sharedBackgroundVisibility(.hidden)
                        
                        ToolbarItem(placement: .title){
                            Text("NOTÍCIAS")
                                .font(Font.custom("Fredoka-Medium", size: 16))
                        }
                    }
                    else {
                        ToolbarItem(placement: .topBarLeading){
                            Button {
                                router.restartNavigation()
                            } label: {
                                Image(systemName: "chevron.left")
                            }
                        }
                        ToolbarItem(placement: .title){
                            Text("NOTÍCIAS")
                                .font(Font.custom("Fredoka-Medium", size: 16))
                        }
                    }
                }
                .frame(height: 720)
            }
            .navigationBarBackButtonHidden(true)
            
            if presentPopup {
                ZStack {
                    Color.black.opacity(0.3).ignoresSafeArea().onTapGesture {
                        withAnimation {
                            presentPopup.toggle()
                        }
                    }
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
