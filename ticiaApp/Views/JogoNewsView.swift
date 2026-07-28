//
//  JogoNewsView.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//

import SwiftUI
import TipKit

struct JogoNewsView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(GameManager.self) var gameManager: GameManager
    @Environment(Router.self) var router: Router
    
    @State private var presentPopup: Bool = false
    @State private var isAcepted: Bool = false
    
    let tipGame = TipGame()
    
    var body: some View {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack (spacing: sizeClass == .regular ? 0 : 0) {
                    //barra de progresso + indicadores de confiança e caos
                    VStack {
                        WordProgressBar(
                            atual: (gameManager.currentNewIndex ?? 0) + 1,
                            total: gameManager.totalNoticias
                        )
                        //indicadores
                        HStack (spacing: 16){
                            //confiança
                            HStack{
                                Image(systemName: "hand.thumbsup.fill")
                                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 18))
                                    .frame(maxWidth: sizeClass == .regular ? 32 : 16)
                                Text("Confiança:")
                                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 36 : 20))
                                Text("\(Int(gameManager.confiancaPoints))%")
                                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 20))
                            }
                            .foregroundStyle(Color.greenTicia)
                            Spacer()
                            //caos
                            HStack{
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 18))
                                    .frame(maxWidth: sizeClass == .regular ? 32 : 14)
                                Text("Caos:")
                                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 36 : 20))
                                Text("\(Int(gameManager.caosPoints))%")
                                    .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 32 : 20))
                            }
                            .foregroundStyle(Color(.red))
                        }
                    }
                    
                    .popoverTip(tipGame)
                    Spacer()
                    
                    //card + botões
                    GeometryReader { geo in
                        let width = geo.size.width

                        VStack (spacing: sizeClass == .regular ? 0 : 0) {
                            Spacer()
                            
                            CardJogo()
                                .frame(
                                    width: geo.size.width * (sizeClass == .regular ? 0.63 : 1),
                                    height: geo.size.height * (0.6)
                                )
                            
                            
                            //botoes
                            HStack (spacing: sizeClass == .regular ? 100 : 28){
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
                                            .lineLimit(1)
                                    }
                                    .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? width * 0.048 : width * 0.06))

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
                                            .lineLimit(1)
                                    }
                                    .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? width * 0.048 : width * 0.06))
                                }
                                .buttonStyle(ButtonPublish())
                            }
                            .padding(EdgeInsets(top: sizeClass == .regular ? 100 : 40, leading: 0, bottom: 0, trailing: 0))
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
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
        .task {
            try? Tips.configure([
                Tips.ConfigurationOption
                .datastoreLocation(.applicationDefault)])
        }
        .onAppear{
            gameManager.startGame()
        }
        .environment(gameManager)
        .environment(router)
}
