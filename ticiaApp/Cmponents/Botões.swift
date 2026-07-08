//
//  BotõesGerador.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//
import SwiftUI

struct ButtonPrimary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(maxWidth: 400)
            .background(Color.blackTicia)
            .clipShape(Capsule())
            .foregroundStyle(Color.white)
            .tint(Color(.black))
            .font(Font.custom("Fredoka-SemiBold", size: 24))
            .opacity(configuration.isPressed ? 0.75 : 1.0)
    }
}

struct ButtonSecondary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(maxWidth: 400)
            .background(
                RoundedRectangle(cornerRadius: 30).stroke(
                    Color(.black),
                    lineWidth: 2
                )
            )
            .opacity(configuration.isPressed ? 0.30 : 1.0)
        
        
            .tint(Color(.black))
            .font(Font.custom("Fredoka-SemiBold", size: 24))
    }
}

struct ButtonTerciary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(width: 370)
            .buttonStyle(PlainButtonStyle())
            .font(Font.custom("Fredoka-Semibold", size: 24))
            .foregroundStyle(Color.blackTicia)
            .opacity(configuration.isPressed ? 0.30 : 1.0)
    }
}

struct ButtonDelete: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(18)
            .frame(width: 150)
            .background(
                RoundedRectangle(cornerRadius: 30).stroke(
                    Color(.black),
                    lineWidth: 2
                )
            )
            .opacity(configuration.isPressed ? 0.30 : 1.0)
        
        
            .tint(Color(.black))
            .font(Font.custom("Fredoka-SemiBold", size: 24))
    }
}

struct ButtonPublish: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(18)
            .frame(width: 165)
            .background(Color.blackTicia)
            .clipShape(Capsule())
            .foregroundStyle(Color.white)
            .tint(Color(.black))
            .font(Font.custom("Fredoka-SemiBold", size: 24))
            .opacity(configuration.isPressed ? 0.75 : 1.0)
        
    }
}

struct ButtonAnterior: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(width: 150, height: 44)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(
                        Color(.black),
                        lineWidth: 2
                    )
                
            )
        
            .tint(Color(.black))
            .font(Font.custom("Fredoka-Medium", size: 20))
            .opacity(isEnabled ? 1 : 0.3)
            .opacity(configuration.isPressed ? 0.30 : 1.0)
        
        
    }
}

struct ButtonProximo: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(18)
            .frame(width: 150, height: 44)
            .background(Color.blackTicia)
            .clipShape(Capsule())
            .foregroundStyle(Color.white)
            .tint(Color(.black))
            .font(Font.custom("Fredoka-Medium", size: 20))        
            .opacity(isEnabled ? 1 : 0.3)
            .opacity(configuration.isPressed ? 0.75 : 1.0)
        
        
    }
}

