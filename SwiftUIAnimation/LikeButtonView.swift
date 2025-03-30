//
//  LikeButtonView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/30.
//

import SwiftUI

struct LikeButtonView: View {
    @State private var isLiked = false
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isLiked.toggle()
                animationAmount = 1.5
                
                // アニメーション終了後に元のサイズに戻す
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        animationAmount = 1.0
                    }
                }
            }
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 40))
                .foregroundColor(isLiked ? .red : .gray)
                .scaleEffect(animationAmount)
                .overlay(
                    isLiked ? 
                    ZStack {
                        // いいねした時に星のようなエフェクトを表示
                        ForEach(0..<8) { i in
                            Circle()
                                .fill(Color.red)
                                .frame(width: 5, height: 5)
                                .offset(x: 25 * cos(Double(i) * .pi / 4), y: 25 * sin(Double(i) * .pi / 4))
                                .opacity(isLiked ? 0 : 1)
                                .animation(
                                    Animation.easeOut(duration: 0.5)
                                        .delay(0.1)
                                )
                        }
                    } : nil
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    LikeButtonView()
} 