//
//  JogoNewsView.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct JogoNewsView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(GameManager.self) var gameManager: GameManager
    @Environment(Router.self) var router: Router
    
    @State private var presentPopup: Bool = false
    @State private var isAcepted: Bool = false
    
    var body: some View {
        ZStack {
            VStack (spacing: sizeClass == .regular ? 80 : 100) {
                VStack {
                    WordProgressBar(
                        atual: (gameManager.currentNewIndex ?? 0) + 1,
                        total: gameManager.totalNoticias
                    )
                    HStack (spacing: 16){
                        HStack{
                            Image(systemName: "hand.thumbsup.fill")
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 20))
                                .frame(maxWidth: sizeClass == .regular ? 32 : 16)
                            Text("Confiança:")
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 36 : 24))
                            Text("\(Int(gameManager.confiancaPoints))%")
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 24))
                        }
                        .foregroundStyle(Color.greenTicia)
                        Spacer()
                        HStack{
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 20))
                                .frame(maxWidth: sizeClass == .regular ? 32 : 14)
                            Text("Caos:")
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 36 : 24))
                            Text("\(Int(gameManager.caosPoints))%")
                                .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 24))
                        }
                        .foregroundStyle(Color(.red))
                    }
                }
                
                VStack (spacing: sizeClass == .regular ? 110 : 110){
                    //card das noticias
                    CardJogo()
                    //botoes
                    HStack (spacing: sizeClass == .regular ? 140 : 30){
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
                .padding(.leading, 16)
                .padding(.trailing, 16)

            }
            .padding(EdgeInsets(top: sizeClass == .regular ? 0 : 0, leading: sizeClass == .regular ? 28 : 24, bottom: sizeClass == .regular ? 32 : 20, trailing: sizeClass == .regular ? 28: 24))
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
