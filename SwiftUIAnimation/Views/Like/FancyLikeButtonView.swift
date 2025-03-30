//
//  FancyLikeButtonView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/30.
//

import SwiftUI

struct FancyLikeButtonView: View {
    @State private var isLiked = false
    @State private var animationAmount = 1.0
    @State private var particlesActive = false
    
    // パーティクルの数
    let particleCount = 12
    
    var body: some View {
        ZStack {
            // パーティクルアニメーション
            ForEach(0..<particleCount, id: \.self) { i in
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.pink, .red]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 8, height: 8)
                    .offset(
                        x: particlesActive ? 50 * cos(Double(i) * .pi * 2 / Double(particleCount)) : 0,
                        y: particlesActive ? 50 * sin(Double(i) * .pi * 2 / Double(particleCount)) : 0
                    )
                    .opacity(particlesActive ? 0 : 1)
                    .animation(
                        Animation
                            .easeOut(duration: 0.8)
                            .delay(0.1)
                            .speed(1.5),
                        value: particlesActive
                    )
            }
            
            // いいねボタン
            Button(action: {
                // アニメーションの実行
                isLiked.toggle()
                
                withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                    animationAmount = 1.8
                }
                
                // パーティクルアニメーションの開始
                particlesActive = true
                
                // アニメーション終了処理
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                        animationAmount = 1.0
                    }
                }
                
                // パーティクルをリセット
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    particlesActive = false
                }
            }) {
                ZStack {
                    // バックの円形（いいねの時だけ表示）
                    if isLiked {
                        Circle()
                            .fill(Color.red.opacity(0.3))
                            .frame(width: 55, height: 55)
                            .scaleEffect(animationAmount)
                    }
                    
                    // ハートアイコン
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.system(size: 40))
                        .foregroundColor(isLiked ? .red : .gray)
                        .scaleEffect(animationAmount)
                        .shadow(color: isLiked ? .red.opacity(0.7) : .clear, radius: isLiked ? 10 : 0)
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
    }
}

#Preview {
    FancyLikeButtonView()
        .preferredColorScheme(.dark)
} 