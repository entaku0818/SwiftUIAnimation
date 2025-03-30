//
//  SoundDemoView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/30.
//

import SwiftUI

struct SoundDemoView: View {
    @StateObject private var audioViewModel = AudioViewModel()
    @State private var selectedVisualization: VisualizationType = .waveform
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("オーディオアニメーションデモ")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // シンプルな再生コントロール
                HStack(spacing: 40) {
                    Button(action: {
                        audioViewModel.togglePlayback()
                    }) {
                        Image(systemName: audioViewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                    }
                    
                    Image(systemName: "waveform")
                        .font(.system(size: 50))
                        .foregroundColor(audioViewModel.isPlaying ? .blue : .gray)
                        .opacity(audioViewModel.isPlaying ? 1.0 : 0.5)
                }
                .padding()
                
                // 波形表示
                VStack(alignment: .leading) {
                    Text("波形ビジュアライザー")
                        .font(.headline)
                    
                    HStack(alignment: .bottom, spacing: 2) {
                        ForEach(0..<audioViewModel.waveData.count, id: \.self) { index in
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 5, height: audioViewModel.waveData[index] * 100)
                                .cornerRadius(2)
                        }
                    }
                    .frame(height: 100)
                    .animation(.easeInOut(duration: 0.2), value: audioViewModel.waveData)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // 円形ビジュアライザー
                VStack {
                    Text("円形ビジュアライザー")
                        .font(.headline)
                    
                    CircularView(data: audioViewModel.waveData, isPlaying: audioViewModel.isPlaying)
                        .frame(width: 200, height: 200)
                }
                
                // イコライザー
                VStack {
                    Text("イコライザー")
                        .font(.headline)
                    
                    EqualizerView(data: audioViewModel.waveData.prefix(10).map { $0 }, isPlaying: audioViewModel.isPlaying)
                        .frame(height: 120)
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            // 波形アニメーションを開始
            audioViewModel.togglePlayback()
        }
        .onDisappear {
            // 再生を停止
            if audioViewModel.isPlaying {
                audioViewModel.togglePlayback()
            }
        }
    }
}

#Preview {
    SoundDemoView()
} 