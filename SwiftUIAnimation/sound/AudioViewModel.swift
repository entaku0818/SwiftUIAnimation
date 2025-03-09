//
//  AudioViewModel.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//

import Foundation
import Combine


// オーディオ再生と可視化の状態を管理するViewModel
class AudioViewModel: ObservableObject {
    // オーディオ再生の状態
    @Published var isPlaying: Bool = false
    @Published var volume: Double = 0.75
    @Published var currentTime: TimeInterval = 0
    @Published var visualizationType: VisualizationType = .waveform
    
    // 可視化データ
    @Published var waveData: [CGFloat] = []
    
    // 現在のトラック情報
    @Published var currentTrack: AudioTrack?
    
    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()
    
    init(track: AudioTrack? = nil) {
        self.currentTrack = track
        generateWaveData()
        
        // isPlayingの変更を監視
        $isPlaying
            .sink { [weak self] playing in
                if playing {
                    self?.startWaveformAnimation()
                } else {
                    self?.stopWaveformAnimation()
                }
            }
            .store(in: &cancellables)
    }
    
    // 波形データをランダムに生成
    func generateWaveData() {
        waveData = (0..<40).map { _ in CGFloat.random(in: 0.1...0.6) }
    }
    
    // 再生/停止の切り替え
    func togglePlayback() {
        isPlaying.toggle()
    }
    
    // 波形アニメーションの開始
    private func startWaveformAnimation() {
        stopWaveformAnimation() // 既存のタイマーをクリア
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.generateWaveData()
            
            if let track = self.currentTrack, self.currentTime < track.duration && self.isPlaying {
                self.currentTime += 0.15
            } else if let track = self.currentTrack, self.currentTime >= track.duration {
                self.isPlaying = false
                self.currentTime = 0
            }
        }
    }
    
    // 波形アニメーションの停止
    private func stopWaveformAnimation() {
        timer?.invalidate()
        timer = nil
    }
    
    // シーク位置の設定
    func seek(to time: TimeInterval) {
        guard let track = currentTrack else { return }
        currentTime = min(max(0, time), track.duration)
    }
    
    // 新しいトラックの設定
    func setTrack(_ track: AudioTrack) {
        currentTrack = track
        currentTime = 0
        isPlaying = false
    }
    
    deinit {
        stopWaveformAnimation()
        cancellables.forEach { $0.cancel() }
    }
}

