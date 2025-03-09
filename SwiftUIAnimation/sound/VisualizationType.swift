//
//  VisualizationType.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//



// 可視化タイプの列挙型
enum VisualizationType: String, CaseIterable, Identifiable {
    case waveform = "波形"
    case circular = "円形"
    case equalizer = "イコライザー"
    
    var id: String { self.rawValue }
}