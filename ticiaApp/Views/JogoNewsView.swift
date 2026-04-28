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
    
    @State private var progressGame: Double = 0.80
    @State private var presentPopup: Bool = false
    @State private var isAcepted: Bool = false
    @State private var isTrue: Bool = newsList[0].isTrue
    
    @State private var navigateEndGame: Bool = false
    
//    let currentNew = newsList[0]

//    private var noticia: [NoticiaElemento] = NoticiaElemento.todasNoticias
    
    var body: some View {
        VStack {
            HStack (spacing: 20){
                Gauge(value: progressGame){
                    //
                }
                .tint(Color(.black))
                HStack{
                    HStack{
                        Image(systemName: "hand.thumbsup.fill")
                            .frame(width: 10)
                        Text("80%")
                    }
                    .foregroundStyle(Color.greenTicia)
                    HStack{
                        Image(systemName: "exclamationmark.triangle.fill")
                            .frame(width: 15)
                        Text("20%")
                    }
                    .foregroundStyle(Color(.red))
                }
            }
            .position(x: 180, y: 0)
            .padding(18)
            .font(Font.system(size: 16, weight: .bold))
            .frame(width: 402, height: 40)
            
            VStack (spacing: 90){
                VStack (alignment: .leading){
                    GroupBox{
                        Image("cardImage")
                            .resizable()
                            .frame(width: 300, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading){
                            Text(gameManager.currentNew?.manchete ?? "Sem valor")
                                .font(Font.custom("Fredoka-SemiBold", size: 24))

                            Text(gameManager.currentNew?.texto ?? "Sem valor")
                                .font(Font.custom("Fredoka-Regular", size: 16))
                                .frame(maxHeight: 100)
                                .foregroundStyle(Color(.secondaryLabel))
                            VStack(alignment: .leading){
                                Text("Fonte: \(gameManager.currentNew?.fonte)")
                                    .font(Font.custom("Fredoka-Regular", size: 15))
                            }
                        }
                    }
                    
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .stroke(Color(.lightGray), lineWidth: 1))
                    .foregroundStyle(Color.blackTicia)
                    .frame(maxWidth: 327 , maxHeight: 393)
                    .backgroundStyle(Color.clear)
                }
                
                
                HStack (spacing: 30){
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
                }
                .font(Font.custom("Fredoka-Semibold", size: 24))

            }
            .toolbar{
                    ToolbarItem(placement: .title){
                        Button(action: {
                            //
                        }, label: {
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
                    Color.black.opacity(0.3).ignoresSafeArea().onTapGesture {
                        withAnimation {
                            presentPopup.toggle()
                        }
                    }
                }
                PopUpView(presentPopup: $presentPopup, isTrue: $isTrue, isAcepted: $isAcepted)
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
