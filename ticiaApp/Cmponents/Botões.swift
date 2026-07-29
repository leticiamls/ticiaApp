//
//  BotõesGerador.swift
//  ticiaApp
//
//  Created by User on 27/04/26.
//
import SwiftUI

struct ButtonPrimary: ButtonStyle {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(sizeClass == .regular ? 24 : 16)
            .frame(maxWidth: sizeClass == .regular ? 600 : 400)
            .background(Color.blackTicia)
            .clipShape(Capsule())
            .foregroundStyle(Color.background)
            .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 42 : 24))
    }}

struct ButtonSecondary: ButtonStyle {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(sizeClass == .regular ? 24 : 16)
            .frame(maxWidth: sizeClass == .regular ? 600 : 400)
            .background(
                RoundedRectangle(cornerRadius: sizeClass == .regular ? 100 : 30).stroke(
                    Color(.blackTicia),
                    lineWidth: 2
                )
            )
            .opacity(configuration.isPressed ? 0.30 : 1.0)
        
        
            .tint(Color(.blackTicia))
            .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 42 : 24))
    }
}

struct ButtonTerciary: ButtonStyle {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(sizeClass == .regular ? 24 : 16)
            .frame(maxWidth: sizeClass == .regular ? 600 : 400)
            .buttonStyle(PlainButtonStyle())
            .font(Font.custom("Fredoka-SemiBold", size: sizeClass == .regular ? 42 : 24))
            .foregroundStyle(Color.blackTicia)
            .opacity(configuration.isPressed ? 0.30 : 1.0)
    }
}

struct ButtonDelete: ButtonStyle {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(sizeClass == .regular ? 24: 18)
            .frame(maxWidth: sizeClass == .regular ? 300 : .infinity)
            .background(
                RoundedRectangle(cornerRadius: sizeClass == .regular ? 100 : 30).stroke(
                    Color(.blackTicia),
                    lineWidth: 2
                )
            )
            .opacity(configuration.isPressed ? 0.30 : 1.0)
    }
}

struct ButtonPublish: ButtonStyle {
    @Environment(\.horizontalSizeClass) var sizeClass
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(sizeClass == .regular ? 24 : 18)
            .frame(maxWidth: sizeClass == .regular ? .infinity : .infinity)
            .background(Color.blackTicia)
            .clipShape(Capsule())
            .foregroundStyle(Color.background)
            .opacity(configuration.isPressed ? 0.75 : 1.0)
    }
}

struct ButtonAnterior: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.horizontalSizeClass) var sizeClass
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(sizeClass == .regular ? 24: 18)
            .frame(maxWidth: sizeClass == .regular ? 300 : .infinity)
            .background(
                RoundedRectangle(cornerRadius: sizeClass == .regular ? 100 : 30)
                    .stroke(
                        Color(.blackTicia),
                        lineWidth: 2
                    )
            )
            .tint(Color(.blackTicia))
            .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 36 : 20))
            .opacity(isEnabled ? 1 : 0.3)
            .opacity(configuration.isPressed ? 0.30 : 1.0)
    }
}

struct ButtonProximo: ButtonStyle {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(sizeClass == .regular ? 24: 18)
            .frame(maxWidth: sizeClass == .regular ? 300 : .infinity)
            .background(Color.blackTicia)
            .clipShape(Capsule())
            .foregroundStyle(Color.background)
            .tint(Color(.blackTicia))
            .font(Font.custom("Fredoka-Medium", size: sizeClass == .regular ? 36 : 20))
            .opacity(isEnabled ? 1 : 0.3)
            .opacity(configuration.isPressed ? 0.75 : 1.0)
    }
}
