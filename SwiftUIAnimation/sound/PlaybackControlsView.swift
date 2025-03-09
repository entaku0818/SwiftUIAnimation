//
//  PlaybackControlsView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//


import SwiftUI

// 再生コントロールビュー
struct PlaybackControlsView: View {
    @Binding var isPlaying: Bool
    var onPrevious: () -> Void
    var onNext: () -> Void
    
    var body: some View {
        HStack(spacing: 40) {
            Button(action: onPrevious) {
                Image(systemName: "backward.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            
            Button(action: { isPlaying.toggle() }) {
                Circle()
                    .fill(isPlaying ? Color.red : Color.blue)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    )
            }
            
            Button(action: onNext) {
                Image(systemName: "forward.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
    }
}
