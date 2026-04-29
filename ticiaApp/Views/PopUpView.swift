//
//  PopUpView.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct PopUpView: View {
    @Environment(GameManager.self) var gameManager: GameManager
    @Binding var presentPopup: Bool
    let isTrue: Bool
    @Binding var isAcepted: Bool    
    
    
    var body: some View {
        //SE ERRAR
        if isTrue == true && isAcepted == false
            || isTrue == false && isAcepted == true {
            PopUpViewNegative(presentPopup: $presentPopup)
                .onAppear {
                    gameManager.caosPoints += 10
                        print("aaaa")
                }
            
        }
        //SE ACERTAR
        else if isTrue == true && isAcepted == true
            || isTrue == false && isAcepted == false
        {
            PopUpViewPositive(presentPopup: $presentPopup)
                .onAppear{
                    gameManager.confiancaPoints += 10
                }
        }
        else{
            Text("a")
        }
    }
}

#Preview {
    @Previewable @State var gameManager = GameManager()
    @Previewable @State var isTrue: Bool = false
    @Previewable @State var isAcepted: Bool = false
    PopUpView(presentPopup: .constant(true), isTrue: isTrue, isAcepted: $isAcepted)
        .environment(gameManager)

}


//
//else {
//    if isTrue {
////        PopUpViewNegative(presentPopup: $presentPopup)
//        // perde os pontos
//    }
//    else {
//        // ganha pontos
//    }
//}

//
//if isTrue == true && isAcepted == false
//    || isTrue == false && isAcepted == true {
//    PopUpViewNegative(presentPopup: $presentPopup)
//    
//}
////SE ACERTAR
//else if isTrue == true && isAcepted == true
//    || isTrue == false && isAcepted == false
//{
//    PopUpViewPositive(presentPopup: $presentPopup)
//}
//else{
//    Text("a")
//}
