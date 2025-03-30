//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // 基本的ないいねアニメーション
            VStack(spacing: 30) {
                Text("シンプルないいねアニメーション")
                    .font(.headline)
                LikeButtonView()
                
                Text("タップしてみてください")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .tabItem {
                Label("シンプル", systemImage: "heart")
            }
            
            // 豪華ないいねアニメーション
            VStack(spacing: 30) {
                Text("豪華ないいねアニメーション")
                    .font(.headline)
                FancyLikeButtonView()
                
                Text("タップしてみてください")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .tabItem {
                Label("豪華", systemImage: "heart.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
