//
//  JogarView.swift
//  ticiaApp
//
//  Created by User on 23/04/26.
//
import SwiftUI

struct JogarView: View {
    @State private var progressGame: Double = 0.80
    var body: some View {
        NavigationStack {
            HStack{
                Gauge(value: progressGame){
                    //
                }
                .tint(Color(.black))
                HStack{
                    Image(systemName: "hand.thumbsup.fill")
                    Text("80%")
                }
                .foregroundStyle(Color(.green))
                HStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("20%")
                }
                .foregroundStyle(Color(.red))
            }
            .font(Font.system(size: 16, weight: .bold))

            .padding(20)
            
            HStack (spacing: 30){
                Button {
                    //
                }
                label: {
                    HStack{
                        Image(systemName: "checkmark")
                        Text("Publicar")
                    }
                    .padding(10)
                    .frame(width: 150)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(.black))
                .font(Font.system(size: 24, weight: .bold))
                
                Button {
                    
                }
                label: {
                    HStack{
                        Image(systemName: "xmark")
                        Text("Excluir")
                    }
                    .padding(18)
                    .frame(width: 150)
                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color(.black), lineWidth: 2))
                }
                .tint(Color(.black))
                .font(Font.system(size: 24, weight: .bold))
            }
            
            
            
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button(action: {
                            
                            //
                        }, label: {
                            Image(systemName: "chevron.left")
                        })
                    }
                    
                    ToolbarItem(placement: .title){
                        Button(action: {
                            
                            //
                        }, label: {
                            Text("NOTÍCIA 1 DE 10")
                                .font(Font.system(size: 16, weight: .semibold))
                        })
                    }
                }
        }
       
    }
}

#Preview {
    JogarView()
}
