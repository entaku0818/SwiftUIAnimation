//
//  SeekBarView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//

import SwiftUI

// シークバーとタイムビュー
struct SeekBarView: View {
    @ObservedObject var viewModel: AudioViewModel
    
    var body: some View {
        VStack(spacing: 4) {
            Slider(
                value: Binding(
                    get: { viewModel.currentTime },
                    set: { viewModel.seek(to: $0) }
                ),
                in: 0...(viewModel.currentTrack?.duration ?? 1)
            )
            .accentColor(.blue)
            
            HStack {
                Text(formatTime(viewModel.currentTime))
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(formatTime(viewModel.currentTrack?.duration ?? 0))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}
