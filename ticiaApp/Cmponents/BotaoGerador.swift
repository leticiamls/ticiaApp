//
//  BotaoGerador.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//
import SwiftUI

struct ButtonPrimary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(width: 340)
            .background(Color.blackTicia)
            .clipShape(Capsule())
            .foregroundStyle(Color.white)
            .tint(Color(.black))
            .font(Font.custom("Fredoka-SemiBold", size: 24))
    }
}

struct ButtonSecondary: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(16)
            .frame(width: 327)
            .background(
                RoundedRectangle(cornerRadius: 30).stroke(
                    Color(.black),
                    lineWidth: 2
                )
            )

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

    }
}
