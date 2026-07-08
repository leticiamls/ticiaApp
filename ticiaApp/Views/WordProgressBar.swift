//
//  WordProgressBar.swift
//  ticiaApp
//
//  Created by marquiros on 08/07/26.
//


import SwiftUI

struct WordProgressBar: View {
    let atual: Int
    let total: Int
    
    private var progress: CGFloat {
        if total > 0 {
            return CGFloat(atual) / CGFloat(total)
        } else {
            return 0
        }
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.3))
            Rectangle()
                .fill(Color.black)
                .scaleEffect(x: progress, y: 1, anchor: .leading)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(maxWidth: .infinity, maxHeight: 28)
        .overlay(
            Text("\(atual)/\(total)")
                .font(.system(size: 18, weight: .heavy, design: .rounded))
                .foregroundStyle(Color.white)
                .shadow(color: .black, radius: 0.3, x: 0, y: 0)
                .shadow(color: .black, radius: 0.3, x: 0, y: 0)
                .shadow(color: .black, radius: 0.3, x: 0, y: 0)
                .shadow(color: .black, radius: 0.3, x: 0, y: 0)
        )
    }
}

#Preview {
    ZStack {
        WordProgressBar(atual: 4, total: 10)
            .padding()
    }
}
