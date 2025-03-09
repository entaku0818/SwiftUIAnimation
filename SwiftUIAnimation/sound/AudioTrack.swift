//
//  AudioTrack.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//


import SwiftUI
import Combine

// オーディオデータのモデル
struct AudioTrack: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let duration: TimeInterval
    let fileFormat: String
    let bitrate: String
    let sampleRate: String
}


