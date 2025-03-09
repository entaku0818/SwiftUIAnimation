//
//  AudioControlsView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//

import SwiftUI

// ボリュームとタイプ選択ビュー
struct AudioControlsView: View {
    @Binding var volume: Double
    @Binding var visualizationType: VisualizationType
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "speaker.wave.1.fill")
                .foregroundColor(.gray)
            
            Slider(value: $volume, in: 0...1)
                .accentColor(.blue)
            
            Image(systemName: "speaker.wave.3.fill")
                .foregroundColor(.gray)
            
            Spacer()
            
            Picker("", selection: $visualizationType) {
                ForEach(VisualizationType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(width: 120)
        }
    }
}
