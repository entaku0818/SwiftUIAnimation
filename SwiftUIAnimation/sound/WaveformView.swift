//
//  WaveformView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/09.
//

import SwiftUI

// 波形表示ビュー
struct WaveformView: View {
    let data: [CGFloat]
    let isPlaying: Bool
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<data.count, id: \.self) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(isPlaying ? Color.blue : Color.blue.opacity(0.7))
                    .frame(width: 6, height: data[index] * 80)
                    .animation(.easeInOut(duration: 0.1), value: data[index])
            }
        }
    }
}
